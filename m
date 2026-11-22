Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388187;
	b=SU04pZ7PW96WmqAmAV2kZeS0WMy4BcKSZfpAiKhWn9UCN2EKLa5xOCgi/1p/vvFJCzvq
	 2JyiL0lN681unW6xXlH1098/fQJppMLSiBJBFZ0dF8BqyxsqGVZMj0h62/xC+GiOXMM57
	 a9QBxuJ7AK3Bl/APZlLQ9RtKvm0dFsYgAyP2i9coTUesCpSp/3mGu+5S8YzSvP5lRHUA8
	 47kQ+WPFSVRDT+PZgR27ILpEdb7DC1/9DI217A0p+dAJBEv8Vu3COfCLEjypV5U2czal4
	 W7p9lsCWdjmZVP97tEKj2dzSKvRnvWCn0jX+FPWE0xKbXT5geS1J+fjmt0bnCdh5pSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388187;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=KIinOygrsBNDkSujvqaAeAdUWcQOoEnFOlfev0JX91E=;
	b=WyMbJM+YDBDin1bAh1C/nHeRY3zVmYvz8PyepRulQ4sRBxWOMB+gmqpmktzd00xBJIqE
	 BjiBHyP5QkABTVX6Ln6hi654MipkP82VujEbRhrPkdJKGKg2xgd8/NFq9JiiE7KILPdFX
	 kMak+8tzXls69hXKI82XlQs6MilFt5P9+31GXazmAxLNvMA/72xbIkP4n7RVLtswuCMkT
	 uwIs4UZeR2nXmWD+tiD6ox9G3gR7xcotv7IA+a8oiGy7xmOu2IMfFK1YE/2fkEUmr9tVY
	 khUAw7O4ttM17kBs5mJw1UPwIBjP//41Mdv0wRbYu36nzU0rUWtaDVzP5EiMdcwV7ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GWI1dkQJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A1C606A31A;
	Sun, 22 Nov 2026 22:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GWI1dkQJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD0B1F000C4;
	Sun, 22 Nov 2026 22:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795388187;
	bh=KIinOygrsBNDkSujvqaAeAdUWcQOoEnFOlfev0JX91E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GWI1dkQJj1xzkIrPk3feli0BlX0HTQwbpPWL7vTQwrt90JG99WcjDP3VgdI08ckNs
	 DqUR0BRsHIF/B0JorclK5Ffkb+E6jrpNCrnjQnD83nv4fLWlKPvYIY2HnLnTwdoX+/
	 6H5L/ED/hEmfiQ7IQ48F0998SoSLizvQynt5hhXx0uih6VIH/bBTbLLSnRkanrQwrm
	 VpDJah4aVNyZE5PQ3Ab10aF/tq+clRZnDsdignidJ9pdvbaUfcNkOB45aQXZKZnNkq
	 xKSuz1Acs4a1Dks4gBbCCcpHR2vF/NbtzPLMj3LI8IG1u+oBXZYHLkzDDT8xXCRMIC
	 YZn8s3qK4ip3g==
Message-ID: <a37ed6db-de5c-4566-9af7-68cd6cf3d77b@kernel.org>
Date: Sun, 22 Nov 2026 22:56:23 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: venus: Signal end-of-stream with a mapped
 buffer
To: emcp@enser.io, Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261122-b4-venus-eos-seek-v1-0-2e38912c7cf9@enser.io>
 <xvOqr6NGA_oI_3jbBAXrpmgzYNUJpfGsBxTbc8Bsqk7dUknmWC1YsnpqotHjGuXGoW1RJFRpSBbwplo-ZPWvxg==@protonmail.internalid>
 <20261122-b4-venus-eos-seek-v1-1-2e38912c7cf9@enser.io>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 xsFNBGRJNSgBEADD7Vm2ZFa+v+JGJ2QYTJqQAkqis/uOHkhdFNXqpBarVBd47QU/DMNU5Rxg
 jedMQEmHoeDbJ6UOpjbrUQ63c5sgG1JbroHJJctwsEI75OOlekMuebEbjIJBLfgENGwPBMHv
 piv5TgCWr0VgYaXfp2eh2LINFywzqj823HiDPibQAXDrjzvF1ogksi/6cQZs8d4if8YQkLOr
 YISFouG+eR0nN1I7mUfIddXOWu6lJeTyqbWVurv58k2ekIXKaOC9ixLHFbcfYV0hOgRaTwQC
 B8CYF9nfqZla19iItfsN9QxN+ZdQjcRoYipp6HPCMfJlKH7GfaFcW93LKc4DKJ2lVL+pg/OQ
 lythZbjRPY492NG9kZ65aYstCs90uhMUEVVPuGUw7wBEku+6IEwZfrbMVKeWzLlPyM4Hv9hM
 8ktxSmxWsPTPqpBC8eyeAQLalMELAyVcZlkaCtEcbj7w4l/JkYz+4l37obG8ZD+B34udBUUz
 MsAJ8foDFrBh2MOFA3hxD6G90D23mmWsri7pnKA2tZs92aQX7Ee+FbCyg6g5ln62Sq83ZDbf
 53DdBs55EVpBadeInWmXhzCHPQx06H+CwTEjShTYIaMmBfrewvYUDKvFTC5iKQhAEUgt6i94
 JsbG7NoeqcxkUMcBOEUQ3uCQG1D70ugspgXc0wd3Rimiq6535wARAQABzSFCcnlhbiBPJ0Rv
 bm9naHVlIDxib2RAa2VybmVsLm9yZz7CwZEEEwEIADsWIQTmk/sqq6Nt4Rerb7QicTuzoY3I
 OgUCZ+R+mwIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRAicTuzoY3IOimUD/94
 BwVEJX31JRe2sxbB/e1w2p8x1bxvTw5AeIzpV3ox7coJg1bSU2mnGuj1V4o0Yxf/3zmcJzCN
 VfVjwRF8Ii3GnC7uUXk2t+87piQfKTyJAYQABhZUKgoVJbjJq/S+C3XCKIyBA+EiezoUsgsA
 jTzwU+FzV7zVWIXFPJNtBERLwboE9w9U3KjAExOa1kSY8eLrsg6kOwlOHWy5UsQqYOjrS96M
 mzm2xuc1+RCjrndAyYhCnrOKvJ67HsPnBeJCjw7ImGD/U1GchwYbX8o3DO3JNHm3qfC86ZqX
 2sCouENg4OzgPTtLKUrueM6xsu6KMM7gj17vxsiR3KQEoJnnMB8D1xtBofN3mFZE0wD9M24m
 8yGunZbtntMCUHzIrlJgAPwKWKuGOYtA8UgMTFkccnUJtQrg9KotKtEF/FuftG9zLG9XEkt4
 5ZdNgbSoLWgelu3T47mbOJ8LHhiLaCWP7yrovtVAvLUQ1BsiA42u8ECrFCFvQj9nrejE/ICv
 kP+uqcKtdDvP9HrIGycF1WZyfZLp0RvopKW92FLvI4I1QFWJ+wenk6+LGyJ5bzlrWzevjxmf
 nHcXE6sJBHrE7eijlbbImDAi3uLYN8Nd9Dm11IDAy4GAIQxSiQn0yblDhPiyGtchy80EVkCm
 g9k17Wol+2E2mC4DKgVdCkyUtTRSLgsJCs7BTQRkSTUoARAAuTnmWHBS6izRcEE93ajpzI7h
 dgQO4U3IRvOEsvIKR5NGcNEs0ngGebwsZ/lVULjN4vYU0LleqVhPBidNXUoZCN3A0F0Z2Ov8
 NZdef+2EhQPBVWxFO7JBzhe8Z3ALj+wFtlg8akJjBzU56azW/iJzAobqHVrudzKoO2b1/CMg
 VbiAQ+RXjgfN5kY/HqYDU7mw+hXuUV9PbtX1L8xqQQac95oM9rHzKHHpiVwxTeJnGQsa+THi
 Kze+YET3rCoGHMvOQEJhdrucTv5FpAakKdkOFNel9FFckLRKEuWgCzhpFsjQ7xbirQgFUxG9
 vlk1+q4hMRGNyEqoD6svYEeqbiUSd0oPUJeioiC3rNMRCNHLVrfZ2J6SCPkxfda08uzSdDQU
 1/YPjOh8ZtQDMu7WctZ3XO288Z1gyBR49V7fbFs2w4sQxG+h/enlxqP7fdw1mjUlZjU5huCJ
 ielS0oEaIpmUpkugli7x4WhwLnhK2EbSoz7nLBC0y+ALUOdMlz/Y1l9xRt+bkDhpmf4O4IcI
 MxgZ0QMLq8rHDkGaEbsgZZHQPS58T0XE3IP30Q9SNxsruCMXtd2hYtBssf/wohc6JVsTtMg2
 VYTPDPIFNZFSXupEJB7jlqpDWJ8ooJfJRLBatbjT5+mVQaMYB7Hs/t+zWYWaJKHyc8O6WLEC
 NUV5Tdt5EkkAEQEAAcLBdgQYAQoAIBYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJkSTUoAhsM
 AAoJECJxO7Ohjcg6LuIQALnXt36OUuK43wqw6UYt0cnN6EbUqJHApAF5eNFn0jCCB2XELjSz
 JKJwuNAweowBdabiBniJ+501WIW+ewEsz1uby5fUQjZuCEsIkuaIluyfUFPb73qrQyAGuusd
 7teA4WT+/jUku9g7lX5sVoRCrKQPkd16f6Bzfztyqyjcn43/X5yQI+wlboQ6HuKe/3I3yiOx
 OgmCHzOawpC9PvhEcKj79RLM3Zz5Ts5AuHpRX70Jz8Be76LwVFLp5Msx3S24ZTU1lBo2uiJ3
 xSkay2lTpyVWRPx9vgcwzxGguOPJQJwsQeLb7wpoJMPpD3ERoaRii7Q7hvmxklpZjhKYWB3d
 t6nQ497Ek9loCrp3MIjRCSDN5xEGffiHks9yTeGMUQwO4tX8RE04uOJPkUY7uCFzFqN6/qey
 X3oFfPgkULMdiHofPAL1OskZSTzGPSfTYRE46NCJw8yoZBQ/oOyWeqaUQbK0wmW/g81wm8p7
 LKSGEglMpiX07M1AotgvylN5C8fjbouoK+/RAMsXkk8jba6rPfuuXPaDjCyyKn6zSVHETnHW
 3AJbgVY50T8STpnxayBQvWbCvu+6NOEjXCbyaOJig+5l0zlGN9XHjdANXC5HnwmyaGRL9YDq
 Jh2nVXVJDincOdQRdKcJjYLqaOAoWrYWSDi1iZGspHBTDrnOvfMQzzHY
In-Reply-To: <20261122-b4-venus-eos-seek-v1-1-2e38912c7cf9@enser.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 05:13, EMCP333 via B4 Relay wrote:
> From: EMCP333 <emcp@enser.io>
> 
> V4L2_ENC_CMD_STOP and V4L2_DEC_CMD_STOP signal end-of-stream by queueing
> an empty input buffer at the made-up device address 0xdeadb000. The
> SDM845 firmware on a OnePlus 6T (VIDEO.VE.5.2-00050-PROD-1) rejects it:
> 
>    qcom-venus aa00000.video-codec: session error: event id:1001 (deadb000)
> 
> and the LAST buffer never comes back. An encoder session then goes on to
> session error 1006 and a system error whose recovery fails ("recovery
> failed to init HFI"), and the encoder is unusable until reboot. A decoder
> leaves the client draining forever: ffmpeg and mpv with v4l2m2m decoded
> 1188 of 1200 frames of a clip, then hung at end of file.
> 
> A zero-length buffer queued by userspace reaches the firmware with the
> EOS flag at its real, mapped address, and is accepted. Do the same for
> STOP: allocate one small buffer per instance the first time STOP is
> issued, against the core device like the internal buffers, and free it
> once the session has been destroyed at close. The IRIS2 branch for old
> firmware, which needs address 0, is unchanged.
> 
> Tested on a OnePlus 6T with this change on the postmarketOS sdm845
> kernel (6.18): three 640x480 H.264 encodes in one boot, each drained
> with ENC_CMD_STOP, all reach end-of-stream with a valid stream; decoding
> one of them returns all 90 frames and end-of-stream; no session or
> system errors are logged.
> 
> The code and this changelog were prepared with the help of an AI coding
> assistant. The submitter has reviewed both and takes responsibility for
> them.
> 
> Fixes: e69b987a9759 ("media: venus: reimplement decoder stop command")
> Fixes: 7493db46e4c4 ("venus: venc: add handling for VIDIOC_ENCODER_CMD")
> Signed-off-by: EMCP333 <emcp@enser.io>
> ---
>   drivers/media/platform/qcom/venus/core.h    |  4 ++++
>   drivers/media/platform/qcom/venus/helpers.c | 35 +++++++++++++++++++++++++++++
>   drivers/media/platform/qcom/venus/helpers.h |  3 +++
>   drivers/media/platform/qcom/venus/vdec.c    | 11 ++++++---
>   drivers/media/platform/qcom/venus/venc.c    |  7 +++++-
>   5 files changed, 56 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 93fa77f058..f521bccfe3 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -463,6 +463,8 @@ enum venus_inst_modes {
>    * @drain_active:	Drain sequence is in progress
>    * @flags:	bitmask flags describing current instance mode
>    * @dpb_ids:	DPB buffer ID's
> + * @eos_va:	CPU address of the empty buffer that carries end-of-stream
> + * @eos_da:	device address of that buffer
>    */
>   struct venus_inst {
>   	struct list_head list;
> @@ -534,6 +536,8 @@ struct venus_inst {
>   	bool drain_active;
>   	enum venus_inst_modes flags;
>   	struct ida dpb_ids;
> +	void *eos_va;
> +	dma_addr_t eos_da;
>   };
> 
>   #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 59eee3dd9e..e0bd2b0478 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -3,9 +3,11 @@
>    * Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
>    * Copyright (C) 2017 Linaro Ltd.
>    */
> +#include <linux/dma-mapping.h>
>   #include <linux/idr.h>
>   #include <linux/list.h>
>   #include <linux/mutex.h>
> +#include <linux/sizes.h>
>   #include <linux/slab.h>
>   #include <linux/kernel.h>
>   #include <media/videobuf2-dma-contig.h>
> @@ -1541,6 +1543,39 @@ void venus_helper_buffers_done(struct venus_inst *inst, unsigned int type,
>   }
>   EXPORT_SYMBOL_GPL(venus_helper_buffers_done);
> 
> +#define VENUS_EOS_BUF_SIZE	SZ_4K
> +
> +/*
> + * The STOP commands signal end-of-stream with an empty input buffer. Give it
> + * a real, mapped address, as a zero-length buffer queued by userspace has:
> + * SDM845 firmware rejects a made-up one (session error 1001), and the LAST
> + * buffer then never comes back.
> + */
> +int venus_helper_eos_buf(struct venus_inst *inst, struct hfi_frame_data *fdata)
> +{
> +	if (!inst->eos_va) {
> +		inst->eos_va = dma_alloc_attrs(inst->core->dev, VENUS_EOS_BUF_SIZE,
> +					       &inst->eos_da, GFP_KERNEL, 0);
> +		if (!inst->eos_va)
> +			return -ENOMEM;
> +	}
> +	fdata->device_addr = inst->eos_da;
> +	fdata->alloc_len = VENUS_EOS_BUF_SIZE;
> +	fdata->filled_len = 0;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(venus_helper_eos_buf);
> +
> +void venus_helper_free_eos(struct venus_inst *inst)
> +{
> +	if (!inst->eos_va)
> +		return;
> +	dma_free_attrs(inst->core->dev, VENUS_EOS_BUF_SIZE, inst->eos_va,
> +		       inst->eos_da, 0);
> +	inst->eos_va = NULL;
> +}
> +EXPORT_SYMBOL_GPL(venus_helper_free_eos);
> +
>   void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
>   {
>   	struct venus_inst *inst = vb2_get_drv_priv(q);
> diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
> index 358e4f39c9..6acae43459 100644
> --- a/drivers/media/platform/qcom/venus/helpers.h
> +++ b/drivers/media/platform/qcom/venus/helpers.h
> @@ -10,6 +10,7 @@
> 
>   struct venus_inst;
>   struct venus_core;
> +struct hfi_frame_data;
> 
>   bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt);
>   struct vb2_v4l2_buffer *venus_helper_find_buf(struct venus_inst *inst,
> @@ -71,4 +72,6 @@ int venus_helper_get_profile_level(struct venus_inst *inst, u32 *profile, u32 *l
>   int venus_helper_set_profile_level(struct venus_inst *inst, u32 profile, u32 level);
>   int venus_helper_set_stride(struct venus_inst *inst, unsigned int aligned_width,
>   			    unsigned int aligned_height);
> +int venus_helper_eos_buf(struct venus_inst *inst, struct hfi_frame_data *fdata);
> +void venus_helper_free_eos(struct venus_inst *inst);
>   #endif
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 6a43ea191d..a49acef5db 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -574,10 +574,13 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>   		 * avoids misapplying this quirk and breaking VP9 decode on SC7280.
>   		 */
> 
> -		if (IS_IRIS2(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
> +		if (IS_IRIS2(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87)) {
>   			fdata.device_addr = 0;
> -		else
> -			fdata.device_addr = 0xdeadb000;
> +		} else {
> +			ret = venus_helper_eos_buf(inst, &fdata);
> +			if (ret)
> +				goto unlock;
> +		}

Duplicates: 
https://patchwork.linuxtv.org/project/linux-media/patch/20260928-venus-vdec-eos-v1-1-6e9eb3ce9849@ixit.cz/

---
bod

