Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094363;
	b=YQT4nyRUFGLxSoVSICqiLilUk1jeY5DaegPu6bhSUGb7uh0beXYYdO8f5Gspzb4j92A+
	 Kw/JFeWpIYwZVjTsW0VK+8gt8QjPs4AQF/rWUTwowYv2ehMeMsY1JKBdwwqT6ZZ5JzPvB
	 Ngcj59OoVeA5X3wBN430ZrNODbcZDlonZG/OxVdExhpRLlhYho1ha4O8hgV/gCf6maidi
	 6peEUJO1m5MhsZ3KKwrnipXlYzoi7CETK4TGLWv+faz3EgAF8kMFS8i/ZVYLcdtRC3YAZ
	 zOKA3JIiGj+RZyP6ENv4siWwMMN+Le7gm2cz9tsEyTU6NShVihTPxzvGIbctPnm75kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094363;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Y1OVXSHvlvZEo/9tU0mtIh7APp20mcVAytWRmOeHWk8=;
	b=lYqOGiogh8F8y4Y39OkGGgb9n2w2knSULHK5+Ypklgbfoz82fGkHA5jUs2W1eWN1/CTV
	 uUh8bIC/ZEFY1135sQrUsT6TgEydS4hLZMMf/LGQeJAiiy1Jcf0kgn/N5mu17ThjLf6lK
	 CyLY0Pp9Jgi1uI2/nzjIkQLjXCZnzB8IO76quzgWLSulGBNgJS/NzJIEQure2+eMGKVzt
	 BoSKRxONq9NNtC3Im/FpL7eUwtSEsdGXIODYtFl90LafpvrOUYVV54aTDtZ4seMywG4oo
	 qAq436uBiim3ZD1AzF78RmeFcYkdbjrDp3UyDNuHrFVBRrk2zo6Z4yo3OGMmYIOVD2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ko2+EvCa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB1E606A320;
	Thu, 19 Nov 2026 13:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ko2+EvCa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388051F000C4;
	Thu, 19 Nov 2026 13:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795094362;
	bh=Y1OVXSHvlvZEo/9tU0mtIh7APp20mcVAytWRmOeHWk8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ko2+EvCaly/s61/qAxmLcjbIxYuzlmKCn6Ia1C/N0oHUt46E4ZFllw3UQEDipu7vK
	 iB3gN2tcltYzbdYdB3A5j2/l0Q9EZxDtBd+cGXqogw2j+Sv3lYTct0mU7T1UPMJRci
	 d9Ij9cfFoZBksYOEHLxrbkqsCTcP2rh40bXFj44Jq3p52LsG/+2sXigZePq4LPk+2z
	 g9JxLTskPe36Fe+C9NWh3A8vsl58l6lgIWgjNJ4x1HsSBKAYFr+ahbeuj+R07z2SoP
	 LMYR4uqnAjCaKkBMBKksIHSIZ0rWVnqK3tgAPmqckRqPKcBpOFxY+0WQrO+pDvR+f8
	 uX3B37sQzPytw==
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/3] media: qcom: iris: add error and status details to
 diagnostics
From: bod@kernel.org
To: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, vikash.garodia@oss.qualcomm.com, 
 dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev, bod@kernel.org, 
 mchehab@kernel.org, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261106153126.120858-3-dipayaan.roy@oss.qualcomm.com>
References: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
 <20261106153126.120858-3-dipayaan.roy@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:19:17 +0000
Message-Id: <179509435732.2846709.9192164322227229466.b4-reply@b4>
X-Mailer: b4 0.17-dev-e3fc9
X-Developer-Signature: v=1; a=openpgp-sha256; l=9975; i=bod@kernel.org;
 h=from:subject:message-id; bh=A9d48vBT/5/HBnNwBb3hxeJq9iMxThbJEbUzCCnkZuE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq/vdV+Lrr/tqnJ/VCEeaZiA+ANyfYo65KflLpW
 yxMoXVBMgKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCav73VQAKCRAicTuzoY3I
 OlVKD/4sY8ocPVGx4RYVDTE2VLk8d/ltmyMKL3XfDKnJk6gquhIIeKNvrKWKSKW0YeA74ozUOO5
 zltrzij820ekRVt/82h46ljZb31i5BQvTr5sw/J/kv+bjUOX2nSEvFrKVaoPzEsoIaTml8MMmpf
 txJ8yYJmG6TnPcWB0IMbRmidwhWJZEZnLwHd0Sd9qlclhoGLbDzQVdFT+fRjl7Nt4PcJUiIz58S
 b7XU/1OYX0ZTzm9TQ4FlUMFB3iG/bD58HWJmDNeSiSY7TvNGCOs5IGYFlP1DgTgotxfK1Va2c/a
 ASDuHyDOwaHlCjv9jYP+kI35QGJz5eCYPF0VpmL4es16rqzBFo22GyphYn5roIOsWUtx+v+FiTw
 B1kSsL4WjZuMm64Cj7Ntf3Y0HMT9ZDJktZYkg58r7Z1YD3U2XWxvYQXPGemn7S4kvTOND50YT4D
 IT9BNkBCKkOT8+/iCUZOb5VoRiK6Ir39gtDhQcz1Q4UXPQ0h8y45r0T+14uo+hKRYE5BBPFjOUu
 pqJ/hnS9iikY9+Gg44bw1u1PBXCQWAUHMluT/s7ux7cPlKbv0b92TOwwAFW8/qQiPp67TDQnB/n
 41wTrG9X4qu1ei1E6XU2ixhB2pa9KZp+F0PjKQhv2LC7yx3ZbO1IuRh7ecmjGhloXHE+MXQW5he
 oQwZ7liqBNcxZ8A==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-11-06 15:31 +0000, Dipayaan Roy wrote:
> Several Iris error messages identify a failed operation without showing
> the return code or state that caused it, making failures difficult to
> diagnose.
> 
> Include available return codes, hardware status, queue positions, and
> packet or session identifiers in these messages. Also report the header
> details when an HFI response fails validation.
> 
> Error handling remains unchanged.
> 
> Signed-off-by: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++--
>  .../platform/qcom/iris/iris_hfi_gen1_response.c    |  9 ++++++---
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |  5 ++++-
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 14 +++++++++----
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  2 +-
>  drivers/media/platform/qcom/iris/iris_vdec.c       |  3 ++-
>  drivers/media/platform/qcom/iris/iris_venc.c       |  3 ++-
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 23 +++++++++++-----------
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      |  6 ++++--
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 15 ++++++++------
>  11 files changed, 53 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> index dad906d03fdc..1fd4cecd7956 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> @@ -138,7 +138,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
>  	return 0;
>  
>  error:
> -	dev_err(core->dev, "failed to suspend\n");
> +	dev_err(core->dev, "failed to suspend: %d\n", ret);
>  
>  	return ret;
>  }
> @@ -179,7 +179,7 @@ int iris_hfi_pm_resume(struct iris_core *core)
>  err_power_off:
>  	iris_vpu_power_off(core);
>  error:
> -	dev_err(core->dev, "failed to resume\n");
> +	dev_err(core->dev, "failed to resume: %d\n", ret);
>  
>  	return -EBUSY;
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index ffa98139f0eb..1ce7f97d4087 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -301,7 +301,8 @@ iris_hfi_gen1_sys_get_prop_image_version(struct iris_core *core,
>  	u32 i;
>  
>  	if (req_bytes < IRIS_FW_VERSION_LENGTH - 1 || !pkt->data[0] || pkt->num_properties > 1) {
> -		dev_err(core->dev, "bad packet\n");
> +		dev_err(core->dev, "invalid firmware version packet (size %u, properties %u)\n",
> +			pkt->hdr.size, pkt->num_properties);
>  		return;
>  	}
>  
> @@ -382,7 +383,8 @@ static void iris_hfi_gen1_session_etb_done(struct iris_inst *inst, void *packet)
>  
>  error:
>  	iris_inst_change_state(inst, IRIS_INST_ERROR);
> -	dev_err(inst->core->dev, "error in etb done\n");
> +	dev_err(inst->core->dev, "ETB done without input buffer (session %#x, tag %u)\n",
> +		inst->session_id, pkt->input_tag);
>  }
>  
>  static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
> @@ -530,7 +532,8 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>  
>  error:
>  	iris_inst_change_state(inst, IRIS_INST_ERROR);
> -	dev_err(core->dev, "error in ftb done\n");
> +	dev_err(core->dev, "FTB done without output buffer (session %#x, tag %u, offset %u)\n",
> +		inst->session_id, output_tag, offset);
>  }
>  
>  static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index f0782c4b1e6e..b82f50458fe1 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -980,8 +980,11 @@ static int iris_hfi_gen2_handle_response(struct iris_core *core, void *response)
>  	int ret;
>  
>  	ret = iris_hfi_gen2_validate_hdr_packet(core, hdr);
> -	if (ret)
> +	if (ret) {
> +		dev_err(core->dev, "invalid HFI response (size %u, packets %u): %d\n",
> +			hdr->size, hdr->num_packets, ret);
>  		return iris_hfi_gen2_handle_system_error(core, NULL);
> +	}
>  
>  	if (!hdr->session_id)
>  		return iris_hfi_gen2_handle_system_response(core, hdr);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index bf6db23b53e2..ef556e54f6f1 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -112,14 +112,18 @@ static int iris_hfi_queue_read(struct iris_iface_q_info *qinfo, void *packet)
>  int iris_hfi_queue_cmd_write_locked(struct iris_core *core, void *pkt, u32 pkt_size)
>  {
>  	struct iris_iface_q_info *q_info = &core->command_queue;
> +	int ret;
>  
>  	if (core->state == IRIS_CORE_ERROR || core->state == IRIS_CORE_DEINIT)
>  		return -EINVAL;
>  
> -	if (!iris_hfi_queue_write(q_info, pkt, pkt_size)) {
> +	ret = iris_hfi_queue_write(q_info, pkt, pkt_size);
> +	if (!ret) {
>  		iris_vpu_raise_interrupt(core);
>  	} else {
> -		dev_err(core->dev, "queue full\n");
> +		dev_err(core->dev, "command queue write failed: %d (size %u, read %u, write %u)\n",
> +			ret, pkt_size, q_info->qhdr->read_idx,
> +			q_info->qhdr->write_idx);
>  		return -ENODATA;
>  	}
>  
> @@ -254,7 +258,8 @@ int iris_hfi_queues_init(struct iris_core *core)
>  						    &core->iface_q_table_daddr,
>  						    GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
>  	if (!core->iface_q_table_vaddr) {
> -		dev_err(core->dev, "queues alloc and map failed\n");
> +		dev_err(core->dev, "failed to allocate HFI queues (%u bytes)\n",
> +			queue_size);
>  		return -ENOMEM;
>  	}
>  
> @@ -262,7 +267,8 @@ int iris_hfi_queues_init(struct iris_core *core)
>  					  &core->sfr_daddr,
>  					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
>  	if (!core->sfr_vaddr) {
> -		dev_err(core->dev, "sfr alloc and map failed\n");
> +		dev_err(core->dev, "failed to allocate SFR (%u bytes)\n",
> +			(unsigned int)SFR_SIZE);
>  		dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
>  			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
>  		return -ENOMEM;
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index 8faf709c26c1..b770cd5349b6 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -135,8 +135,8 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>  
>  		ret = inst->hfi_session_ops->session_open(inst);
>  		if (ret) {
> +			dev_err(core->dev, "session open failed: %d\n", ret);
>  			ret = -EINVAL;
> -			dev_err(core->dev, "session open failed\n");
>  			goto unlock;
>  		}
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 0dd33ff447bb..d359d3716ba1 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -529,7 +529,8 @@ int iris_vdec_start_cmd(struct iris_inst *inst)
>  			clear_sub_state |= IRIS_INST_SUB_OUTPUT_PAUSE;
>  		}
>  	} else {
> -		dev_err(inst->core->dev, "start called before receiving last_flag\n");
> +		dev_err(inst->core->dev, "start before last buffer (sub-state %#x)\n",
> +			inst->sub_state);
>  		iris_inst_change_state(inst, IRIS_INST_ERROR);
>  		return -EBUSY;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 2f2c56bf9122..a7a0f14a78d1 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -602,7 +602,8 @@ int iris_venc_start_cmd(struct iris_inst *inst)
>  			clear_sub_state |= IRIS_INST_SUB_OUTPUT_PAUSE;
>  		}
>  	} else {
> -		dev_err(inst->core->dev, "start called before receiving last_flag\n");
> +		dev_err(inst->core->dev, "start before last buffer (sub-state %#x)\n",
> +			inst->sub_state);
>  		iris_inst_change_state(inst, IRIS_INST_ERROR);
>  		return -EBUSY;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 05aab6e3005d..80f0a56712bf 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -168,7 +168,7 @@ int iris_open(struct file *filp)
>  
>  	ret = iris_core_init(core);
>  	if (ret) {
> -		dev_err(core->dev, "core init failed\n");
> +		dev_err(core->dev, "core init failed: %d\n", ret);
>  		pm_runtime_put_sync(core->dev);
>  		return ret;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index c3b760730c98..cd22534c0904 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -17,14 +17,12 @@
>  #define NOC_HALT				BIT(0)
>  #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
>  
> -static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
> +static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core,
> +					  u32 *power_status)
>  {
> -	u32 value, pwr_status;
> +	*power_status = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>  
> -	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> -	pwr_status = value & BIT(1);
> -
> -	return pwr_status ? false : true;
> +	return !(*power_status & BIT(1));
>  }

This is another example. Your patch says "capture status and return codes
print them" but this change right here is not that.

Please separate out changes like this.
---
bod

