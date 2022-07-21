# Copyright (c) 2022 PaddlePaddle Authors. All Rights Reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export PYTHONPATH=$PYTHONPATH:../../../

log_dir=dp2_pp2_mp2
rm -rf $log_dir

python -m paddle.distributed.launch --log_dir $log_dir --devices "0,1,2,3,4,5,6,7" run_pretrain.py \
    --input_dir "./data"\
    --output_dir "output"\
    --vocab_size 50304\
    --hidden_size 1024\
    --num_layers 24\
    --num_attention_heads 16\
    --max_seq_len 1024\
    --weight_decay 0.01\
    --grad_clip 1.0\
    --max_steps 500000\
    --save_steps 100000\
    --decay_steps 320000\
    --device gpu\
    --eval_freq 1000\
    --warmup_rate 0.01\
    --scale_loss 32768\
    --global_batch_size 32\
    --micro_batch_size 1\
    --dp_degree 2\
    --mp_degree 2\
    --pp_degree 2\
    --use_recompute True\
    --use_pure_fp16 False
