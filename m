Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F773A782B;
	Wed,  5 Aug 2026 04:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785902805; cv=none; b=Yu9tWyAR9ISB3flttB3kGI2as7ZnXbeRB+GaFCEnmwjwOl/XaVvWTTsX9sjIKxmBqfvUD7VelNSMR7H5D7pl2THGIpw4QS4Tyk/yIDYHYqf1ArtzkTDpsoFRT5dYziJRfvKBGKjCpKyisF90HDB1te8EpyW/Xk/WalSls7nt2C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785902805; c=relaxed/simple;
	bh=WLof8XYJweGj7T5BCCdPPJwuqeqx8znXXQfEQcKTeaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUpu9q7DE5bQ85T6m07cz23GFrSmE73at3mn9XX12eCkspWun0gYt2TX59dcEHHZVL+tbnExpdyRmR6V1TqiV9qZhkTNsNJ/kntQWa2xQfzW9UE/Qbr0BV+76FNS0Zx/s0nzdWfr6S6nZ3ghDH6KiA/t72yqZ1vXlwzgXt21FAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QupaMuME; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QupaMuME"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E691F000E9;
	Wed,  5 Aug 2026 04:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785902803;
	bh=5UFnfvTv7fMcDCV/CRA8iymGYSXh/Y1TLLDaSKOidIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QupaMuMEEN0pjBrhT/fw4dsySEpnVOW0Xr3INsZFMPj0awhGON3NJ2u9SFnYrad1g
	 Lmm41fVXJK6lVPBj9G19T8fnam/SNPzTb1YBoZ0raGOSgk2GU8QwlhevODvfydzrj9
	 gawGvbWBf+dVSvcRegmAc9dkOIv09U1FFHRDSBquQzWwhLg7ENGdGDS1i7rs0v0ZmR
	 vNzS0aZAYugjlJKShai/PXZPhFzRsEfbKVm3zNOE6bYw8YMdoGOewakRnR+5e+Spmn
	 Zb3AhsGE/44LV2yXD0A/SgPLftdnwOeP9tcN0xamnOSc5wAkLwsY0jGIBPZRgnwKL0
	 wiihmMO9j07bg==
Message-ID: <e6f1c86a-2eb3-4077-a5f7-be0738b61bea@kernel.org>
Date: Wed, 5 Aug 2026 05:06:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: iris: Add ROI support framework for iris
 video encoder
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com>
 <1lAIHAqmdnQJaaUSdxGhsVNhj5u9yQiKjAPTg11rbsml8oKC7HbO1clXG_260WGcydOrywxg970RogV2Hi2rQQ==@protonmail.internalid>
 <20260804-enc_roi_enable-v3-3-e03b622a2d48@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260804-enc_roi_enable-v3-3-e03b622a2d48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2026 21:05, Deepa Guthyappa Madivalara wrote:
> Add ROI support in the iris driver, including control structures
> and default parameters. Extend support to set ROI parameters
> using custom control V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP.
> Implement internal buffer list support for BUF_ROIMB_DELTAQP that holds
> ROI MB based delta_qp as expected by the firmware. When an input
> arrives queue the corresponding ROI MB delta_qp buffer to firmware.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c     | 101 ++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_buffer.h     |  22 +++++
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 104 ++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |   3 +
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  14 +++
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     |  62 ++++++++++++
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
>   .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   6 +-
>   .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   3 +
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  29 ++++++
>   .../platform/qcom/iris/iris_platform_common.h      |   5 +
>   drivers/media/platform/qcom/iris/iris_venc.c       |   4 +
>   drivers/media/platform/qcom/iris/iris_venc.h       |   2 +
>   drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
>   15 files changed, 357 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index eb8de60c1177f5e1ab83b90a3c8c80e0b4d1f02e..8186a7d011460af4dfcab0f204da08e19b027b33 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -5,11 +5,13 @@
> 
>   #include <media/v4l2-event.h>
>   #include <media/v4l2-mem2mem.h>
> +#include <linux/slab.h>
> 
>   #include "iris_buffer.h"
>   #include "iris_instance.h"
>   #include "iris_power.h"
>   #include "iris_vpu_buffer.h"
> +#include "iris_hfi_gen2_defines.h"
> 
>   #define PIXELS_4K 4096
>   #define MAX_WIDTH 4096
> @@ -705,6 +707,23 @@ int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane)
>   	return iris_destroy_internal_buffers(inst, plane, false);
>   }
> 
> +int iris_destroy_roi_metadata_buffers(struct iris_inst *inst)
> +{
> +	struct iris_buffer *buf, *next;
> +	struct iris_buffers *buffers;
> +	int ret = 0;
> +
> +	if (inst->domain == ENCODER) {
> +		buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
> +		list_for_each_entry_safe(buf, next, &buffers->list, list) {
> +			ret = iris_destroy_internal_buffer(inst, buf);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return ret;
> +}
>   static int iris_release_internal_buffers(struct iris_inst *inst,
>   					 enum iris_buffer_type buffer_type)
>   {
> @@ -928,3 +947,85 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
> 
>   	return 0;
>   }
> +
> +static int iris_fill_roi_data(struct iris_inst *inst, struct iris_buffer *buffer)
> +{
> +	s8 *p_array = (s8 *)inst->fw_caps[ROI_PARAMS].p_array;
> +	u32 array_size = inst->fw_caps[ROI_PARAMS].elems;
> +	struct metabuf_header *mbuf_hdr = buffer->kvaddr;
> +	struct metapayload_header *mbuf_payload_hdr;
> +	s16 *p_16;
> +	u32 payload_offset;
> +
> +	memset(mbuf_hdr, 0, sizeof(struct metabuf_header));
> +	mbuf_hdr->count = 1;
> +	mbuf_hdr->size = sizeof(struct metabuf_header) +
> +			 sizeof(struct metapayload_header);
> +	mbuf_hdr->version = 1 << 16;

That's a weird way to set a header version number though isn't it.

Either say mbuf_hdr->version = 0x10000 or just BIT(16)

> +	mbuf_payload_hdr = (struct metapayload_header *)(mbuf_hdr + 1);
mbuf_hdr++;
mbuf_payload_hdr = (struct metapayload_header *)(mbuf_hdr);

would also work

> +	payload_offset = sizeof(struct metabuf_header) +
> +			 sizeof(struct metapayload_header);
> +
> +	memset(mbuf_payload_hdr, 0, sizeof(struct metapayload_header));

> +	mbuf_payload_hdr->type = HFI_PROP_ROI_INFO;
> +	mbuf_payload_hdr->size = array_size * 2;

Instead of * 2 it should be * sizeof(datatype);

BTW the name "metadata" seems strangely generic.

> +	mbuf_payload_hdr->version = 1 << 16;
> +	mbuf_payload_hdr->offset = ALIGN(payload_offset, (u32)256);
> +	mbuf_payload_hdr->flags = 0;
> +
> +	/* Firmware expects 2bytes of delta_Qp, int16_t */
> +	p_16 = buffer->kvaddr + mbuf_payload_hdr->offset;
> +	for (int i = 0; i < array_size; i++)
> +		p_16[i] = p_array[i];
> +
> +	return 0;
> +}
> +
> +int iris_hfi_gen2_session_alloc_roi_metadata_buffer(struct iris_inst *inst)
> +{
> +	struct iris_buffers *buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
> +	struct iris_core *core = inst->core;
> +	struct iris_buffer *buffer, *first_buffer, *next;
> +	bool found = false;
> +	int ret = 0;
> +
> +	if (!buffers->size)
> +		return 0;
> +
> +	list_for_each_entry_safe(buffer, next, &buffers->list, list) {
> +		if (buffer->attr & BUF_ATTR_DEQUEUED) {
> +			buffer->attr &= ~BUF_ATTR_DEQUEUED;
> +			list_move(&buffer->list, &buffers->list);
> +			found = true;
> +			break;
> +		}
> +	}
> +	if (!found) {
> +		buffer = kzalloc_obj(*buffer);
> +		if (!buffer)
> +			return -ENOMEM;
> +
> +		INIT_LIST_HEAD(&buffer->list);
> +		buffer->type = BUF_ROIMB_DELTAQP;
> +		buffer->index++;
> +		buffer->buffer_size = buffers->size;
> +		buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE;
> +
> +		buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
> +						 &buffer->device_addr, GFP_KERNEL,
> +						 buffer->dma_attrs);
> +
> +		if (!buffer->kvaddr) {
> +			kfree(buffer);
> +			return -ENOMEM;
> +		}
> +		list_add(&buffer->list, &buffers->list);
> +	}
> +
> +	first_buffer = list_first_entry(&buffers->list, struct iris_buffer, list);
> +	ret = iris_fill_roi_data(inst, first_buffer);
> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
> index ab8e5d953101a786ade20540ee3c3ed226160cbe..df9d018493f3ec37fd5e6b0ba049dba0b5ae76e9 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
> @@ -28,6 +28,7 @@ struct iris_inst;
>    * @BUF_SCRATCH_2: buffer to store encoding context data for HW
>    * @BUF_VPSS: buffer to store VPSS context data for HW
>    * @BUF_PARTIAL: buffer for AV1 IBC data
> + * @BUF_ROIMB_DELTAQP: metadata buffer for ROI MB DeltaQp
>    * @BUF_TYPE_MAX: max buffer types
>    */
>   enum iris_buffer_type {
> @@ -44,6 +45,7 @@ enum iris_buffer_type {
>   	BUF_SCRATCH_2,
>   	BUF_VPSS,
>   	BUF_PARTIAL,
> +	BUF_ROIMB_DELTAQP,
>   	BUF_TYPE_MAX,
>   };
> 
> @@ -107,6 +109,24 @@ struct iris_buffers {
>   	u32			size;
>   };
> 
> +/* Metadata buffer header */
> +struct metabuf_header {
> +	u32 count;
> +	u32 size;
> +	u32 version;
> +	u32 reserved[5];
> +};
> +
> +/* Metadata buffer payload header */
> +struct metapayload_header {
> +	u32 type;
> +	u32 size;
> +	u32 version;
> +	u32 offset;
> +	u32 flags;
> +	u32 reserved[3];
> +};

But these are roi metadata buffers not generic metadata buffers right ?

So the name should describe what it is an roi_medatadata_thing not a 
metadata_thing.

OTOH if these are meant to be generic metadata buffers then the addition 
of these data-structures and the associated logic to support them should 
live in their own patch - describing metadata buffers.

> +
>   int iris_get_buffer_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>   void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
>   int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
> @@ -121,5 +141,7 @@ int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
>   int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type);
>   int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf);
>   void iris_vb2_queue_error(struct iris_inst *inst);
> +int iris_hfi_gen2_session_alloc_roi_metadata_buffer(struct iris_inst *inst);
> +int iris_destroy_roi_metadata_buffers(struct iris_inst *inst);
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index bf17d310eac081ffd3a4ad4842c2255ad798d4d8..4da24a29567f7824f91b4d68a8310b248ab62176 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -156,6 +156,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>   		return LAYER5_BITRATE_HEVC;
>   	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
>   		return REQUEST_SYNC_FRAME;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
> +		return ROI_PARAMS;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
> +		return MB_SIZE;
>   	default:
>   		return INST_FW_CAP_MAX;
>   	}
> @@ -301,6 +305,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>   		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
>   	case REQUEST_SYNC_FRAME:
>   		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
> +	case ROI_PARAMS:
> +		return V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP;
> +	case MB_SIZE:
> +		return V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE;
>   	default:
>   		return 0;
>   	}
> @@ -327,6 +335,14 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
> 
>   	inst->fw_caps[cap_id].value = ctrl->val;
> 
> +	if (inst->fw_caps[cap_id].flags & CAP_FLAG_CUSTOM) {
> +		if (cap_id == ROI_PARAMS) {
> +			inst->fw_caps[cap_id].p_array =
> +				(const void *)ctrl->p_new.p;
> +			inst->fw_caps[cap_id].elems = ctrl->new_elems;
> +		}
> +	}
> +
>   	if (vb2_is_streaming(q)) {
>   		if (cap[cap_id].set)
>   			cap[cap_id].set(inst, cap_id);
> @@ -335,8 +351,52 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
>   	return 0;
>   }
> 
> +static int iris_get_roi_mb_size(struct iris_inst *inst)
> +{
> +	return inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> +}
> +
> +static int iris_op_g_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
> +	enum platform_inst_fw_cap_type cap_id;
> +
> +	cap_id = iris_get_cap_id(ctrl->id);
> +	if (!iris_valid_cap_id(cap_id))
> +		return -EINVAL;
> +
> +	if (cap_id == MB_SIZE)
> +		ctrl->val = iris_get_roi_mb_size(inst);
> +
> +	return 0;
> +}
> +
>   static const struct v4l2_ctrl_ops iris_ctrl_ops = {
>   	.s_ctrl = iris_op_s_ctrl,
> +	.g_volatile_ctrl = iris_op_g_ctrl,
> +};
> +
> +const struct v4l2_ctrl_config roi_mbqp_cfg = {
> +	.ops = &iris_ctrl_ops,
> +	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP,
> +	.name = "Enc Mb ROI Delta QP",
> +	.type = V4L2_CTRL_TYPE_S8,
> +	.dims = {139264}, /* Max MBPF = 8192 * 4352 / 256 */
> +	.min = -31,
> +	.max = 30,
> +	.def = 0,
> +	.step = 1,
> +};
> +
> +static const struct v4l2_ctrl_config roi_mbqp_size = {
> +	.ops = &iris_ctrl_ops,
> +	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE,
> +	.name = "ROI Mb size",
> +	.type = V4L2_CTRL_TYPE_U8,
> +	.min = 16,
> +	.max = 32,
> +	.def = 16,
> +	.step = 1,
>   };
> 
>   int iris_ctrls_init(struct iris_inst *inst)
> @@ -361,7 +421,7 @@ int iris_ctrls_init(struct iris_inst *inst)
>   		return ret;
> 
>   	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
> -		struct v4l2_ctrl *ctrl;
> +		struct v4l2_ctrl *ctrl = NULL;
> 
>   		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
>   		if (!v4l2_id)
> @@ -379,6 +439,13 @@ int iris_ctrls_init(struct iris_inst *inst)
>   						      cap[idx].max,
>   						      ~(cap[idx].step_or_mask),
>   						      cap[idx].value);
> +		} else if (cap[idx].flags & CAP_FLAG_CUSTOM) {
> +			if (cap[idx].cap_id == ROI_PARAMS)
> +				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
> +							    &roi_mbqp_cfg, NULL);
> +			if (cap[idx].cap_id == MB_SIZE)
> +				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
> +							    &roi_mbqp_size, NULL);
>   		} else {
>   			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
>   						 &iris_ctrl_ops,
> @@ -1540,3 +1607,38 @@ int iris_set_properties(struct iris_inst *inst, u32 plane)
> 
>   	return 0;
>   }
> +
> +int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	int ret = 0;
> +
> +	/*subscribe to metadata delivery only if ROI is enabled */
> +	if (!inst->fw_caps[ROI_PARAMS].p_array)
> +		return ret;
> +
> +	ret = hfi_ops->session_subscribe_metadata_delivery(inst, plane);
> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> +
> +int iris_set_roi_params(struct iris_inst *inst, u32 plane)
> +{
> +	struct iris_buffers *buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
> +	u32 metadata_header_bytes = 256;
> +	u32 size = 0;
> +	int ret = 0;
> +
> +	if (!inst->fw_caps[ROI_PARAMS].p_array)
> +		return -EINVAL;
> +
> +	size = inst->fw_caps[ROI_PARAMS].elems * 2 + metadata_header_bytes;
> +	buffers->size = ALIGN(size, 4096);
> +	iris_hfi_gen2_session_alloc_roi_metadata_buffer(inst);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 5180d53d3c904cad460b2760913b475d0ff1bb55..df8fa957a6127338ae63bdd44871e363deeb48fc 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -50,5 +50,8 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
>   int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_properties(struct iris_inst *inst, u32 plane);
> +int iris_set_roi_params(struct iris_inst *inst, u32 plane);
> +int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane);
> +int iris_set_roi_mb_size(struct iris_inst *inst);
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index a27447eb2519962cb958b0e330a6d018310c3450..5692375cdd357f9b00760053ffff5af4bd9cce9c 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -131,6 +131,7 @@ struct iris_hfi_session_ops {
>   	int (*session_drain)(struct iris_inst *inst, u32 plane);
>   	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
>   	int (*session_close)(struct iris_inst *inst);
> +	int (*session_subscribe_metadata_delivery)(struct iris_inst *inst, u32 plane);
>   };
> 
>   struct hfi_subscription_params {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index 3b8fbefb8b93576962abd3850215f7b7fb364930..4d40d6733e5877a302ce63fb0b4a61b8f284e6dc 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -1782,6 +1782,20 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>   		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
>   		.set = iris_set_req_sync_frame,
>   	},
> +	{
> +		.cap_id = ROI_PARAMS,
> +		.step_or_mask = 1,
> +		.p_array = NULL,
> +		.hfi_id = HFI_PROP_ROI_INFO,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_CUSTOM |
> +			 CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_roi_params,
> +	},
> +	{
> +		.cap_id = MB_SIZE,
> +		.step_or_mask = 1,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_CUSTOM,
> +	},

The enumeration of the platform and the implementation of the logic 
should be separated into different patches.

>   };
> 
>   static const u32 sm8550_vdec_input_config_params_default[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 388a36ff2b07b7bcd8db21d4345bc900356b4ec3..4581a6ea74a708b0d493bc71d2d1822eda078860 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -134,6 +134,7 @@ static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
>   		switch (buffer_type) {
>   		case BUF_INPUT:
>   		case BUF_VPSS:
> +		case BUF_ROIMB_DELTAQP:
>   			return HFI_PORT_RAW;
>   		case BUF_OUTPUT:
>   		case BUF_BIN:
> @@ -1267,6 +1268,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
>   		return HFI_BUFFER_VPSS;
>   	case BUF_PARTIAL:
>   		return HFI_BUFFER_PARTIAL_DATA;
> +	case BUF_ROIMB_DELTAQP:
> +		return HFI_BUFFER_METADATA;
>   	default:
>   		return 0;
>   	}
> @@ -1307,10 +1310,29 @@ static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
>   	buf->timestamp = buffer->timestamp;
>   }
> 
> +static struct iris_buffer *iris_queue_metadata_buffers(struct iris_inst *inst,
> +						       enum iris_buffer_type buffer_type, u32 index)
> +{
> +	struct iris_buffers *buffers = &inst->buffers[buffer_type];
> +	struct iris_buffer *buffer = NULL;
> +
> +	if (list_empty(&buffers->list))
> +		return NULL;
> +
> +	buffer = list_first_entry(&buffers->list, typeof(*buffer), list);
> +	if ((buffer->attr & BUF_ATTR_QUEUED) || (buffer->attr & BUF_ATTR_DEQUEUED))
> +		return NULL;
> +
> +	buffer->index = index;
> +
> +	return buffer;
> +}
> +
>   static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
>   {
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>   	struct iris_hfi_buffer hfi_buffer;
> +	struct iris_hfi_buffer hfi_meta_buffer;
>   	u32 port;
>   	int ret;
> 
> @@ -1331,6 +1353,25 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
>   					     &hfi_buffer,
>   					     sizeof(hfi_buffer));
> 
> +	/* check if any metadata buffer is available not queued, queueit */
> +	if (port == HFI_PORT_RAW) {
> +		buffer = iris_queue_metadata_buffers(inst, BUF_ROIMB_DELTAQP, buffer->index);
> +		if (buffer) {
> +			iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_meta_buffer);
> +			port = iris_hfi_gen2_get_port_from_buf_type(inst, buffer->type);
> +			iris_hfi_gen2_create_packet(inst_hfi_gen2->packet,
> +						    HFI_CMD_BUFFER,
> +						    HFI_HOST_FLAGS_INTR_REQUIRED,
> +						    HFI_PAYLOAD_STRUCTURE,
> +						    port,
> +						    inst->core->packet_id++,
> +						    &hfi_meta_buffer,
> +						    sizeof(hfi_meta_buffer));
> +
> +			buffer->attr |= BUF_ATTR_QUEUED;
> +			buffer->attr &= ~BUF_ATTR_DEQUEUED;
> +		}
> +	}
>   	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
>   					inst_hfi_gen2->packet->size);
>   }
> @@ -1359,6 +1400,26 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
>   					inst_hfi_gen2->packet->size);
>   }
> 
> +static int iris_hfi_gen2_subscribe_metadata_delivery(struct iris_inst *inst, u32 plane)
> +{
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	u32 payload[2] = {HFI_MODE_METADATA, HFI_PROP_ROI_INFO};
> +
> +	iris_hfi_gen2_packet_session_command(inst,
> +					     HFI_CMD_DELIVERY_MODE,
> +					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
> +					      HFI_HOST_FLAGS_INTR_REQUIRED),
> +					     port,
> +					     inst->session_id,
> +					     HFI_PAYLOAD_U32_ARRAY,
> +					     &payload,
> +					     sizeof(u32) * 2);
> +
> +	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
> +					inst_hfi_gen2->packet->size);
> +}
> +
>   static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
>   	.session_open = iris_hfi_gen2_session_open,
>   	.session_set_config_params = iris_hfi_gen2_session_set_config_params,
> @@ -1372,6 +1433,7 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
>   	.session_drain = iris_hfi_gen2_session_drain,
>   	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
>   	.session_close = iris_hfi_gen2_session_close,
> +	.session_subscribe_metadata_delivery = iris_hfi_gen2_subscribe_metadata_delivery,
>   };
> 
>   static struct iris_inst *iris_hfi_gen2_get_instance(void)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index f43aea10090d8f1d6ae5c20547e5f6321b2ca203..d0661f5fe6a6f39295dad8950edb2f1a85893216 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -20,6 +20,7 @@
>   #define HFI_CMD_DRAIN				0x01000007
>   #define HFI_CMD_RESUME				0x01000008
>   #define HFI_CMD_BUFFER				0x01000009
> +#define HFI_CMD_DELIVERY_MODE		        0x0100000A
>   #define HFI_CMD_SUBSCRIBE_MODE			0x0100000B
>   #define HFI_CMD_SETTINGS_CHANGE			0x0100000C
>   #define HFI_CMD_PAUSE				0x01000011
> @@ -133,6 +134,7 @@ enum hfi_flip {
>   #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
>   #define HFI_PROP_NO_OUTPUT			0x0300016a
>   #define HFI_PROP_BUFFER_MARK			0x0300016c
> +#define HFI_PROP_ROI_INFO			0x03000173
>   #define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
>   #define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
>   #define HFI_PROP_RAW_RESOLUTION		0x03000178
> @@ -174,6 +176,7 @@ enum hfi_flip {
>   enum hfi_property_mode_type {
>   	HFI_MODE_PORT_SETTINGS_CHANGE		= 0x00000001,
>   	HFI_MODE_PROPERTY			= 0x00000002,
> +	HFI_MODE_METADATA			= 0x00000004,
>   };
> 
>   enum hfi_color_format {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 0d05dd2afc07d830cc8502ab5f28001312991ba8..aeb0426a05694f219f82145cd84a28287ed3075e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -100,9 +100,9 @@ static void iris_hfi_gen2_create_header(struct iris_hfi_header *hdr,
>   	hdr->num_packets = 0;
>   }
> 
> -static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
> -					u32 pkt_flags, u32 payload_type, u32 port,
> -					u32 packet_id, void *payload, u32 payload_size)
> +void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
> +				 u32 pkt_flags, u32 payload_type, u32 port,
> +				 u32 packet_id, void *payload, u32 payload_size)
>   {
>   	struct iris_hfi_packet *pkt = (struct iris_hfi_packet *)((u8 *)hdr + hdr->size);
>   	u32 pkt_size = sizeof(*pkt) + payload_size;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
> index 25b9582349ca1a0ce6efc0b146a3abb798485c45..613eb500609f745daebdcbdf9a25b85cb9465a79 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
> @@ -121,5 +121,8 @@ void iris_hfi_gen2_packet_session_property(struct iris_inst *inst,
>   void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
>   						       struct iris_hfi_header *hdr);
>   void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct iris_hfi_header *hdr);
> +void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
> +				 u32 pkt_flags, u32 payload_type, u32 port,
> +				 u32 packet_id, void *payload, u32 payload_size);
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 8c2644c7f6e85983d7ad7584fc0cb570e4813ae4..f63e0a7723e8583da818c2b004e367c1dd3d94f7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -58,6 +58,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
>   		return BUF_PARTIAL;
>   	case HFI_BUFFER_VPSS:
>   		return BUF_VPSS;
> +	case HFI_BUFFER_METADATA:
> +		return BUF_ROIMB_DELTAQP;
>   	default:
>   		return 0;
>   	}
> @@ -77,6 +79,7 @@ static bool iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
>   	case HFI_BUFFER_PERSIST:
>   	case HFI_BUFFER_VPSS:
>   	case HFI_BUFFER_PARTIAL_DATA:
> +	case HFI_BUFFER_METADATA:
>   		return true;
>   	default:
>   		return false;
> @@ -452,6 +455,30 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
>   	return 0;
>   }
> 
> +static int iris_hfi_gen2_handle_output_metadata_buffer(struct iris_inst *inst,
> +						       struct iris_hfi_buffer *buffer)
> +{
> +	u32 buf_type = iris_hfi_gen2_buf_type_to_driver(inst, HFI_BUFFER_METADATA);
> +	struct iris_buffers *buffers = &inst->buffers[buf_type];
> +	struct iris_buffer *buf, *iter;
> +	bool found = false;
> +
> +	list_for_each_entry(iter, &buffers->list, list) {
> +		if (iter->device_addr == buffer->base_address) {
> +			found = true;
> +			buf = iter;
> +			break;
> +		}
> +	}
> +	if (!found)
> +		return -EINVAL;
> +
> +	buf->attr &= ~BUF_ATTR_QUEUED;
> +	buf->attr |= BUF_ATTR_DEQUEUED;
> +
> +	return 0;
> +}
> +
>   static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,
>   					     struct iris_hfi_packet *pkt)
>   {
> @@ -499,6 +526,8 @@ static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
>   			return iris_hfi_gen2_handle_input_buffer(inst, buffer);
>   		else if (buffer->type == HFI_BUFFER_BITSTREAM)
>   			return iris_hfi_gen2_handle_output_buffer(inst, buffer);
> +		else if (buffer->type == HFI_BUFFER_METADATA)
> +			return iris_hfi_gen2_handle_output_metadata_buffer(inst, buffer);
>   		else
>   			return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 9748095091461ba13443c63955a42906fa4f050c..9910eb5514b3ae0a6b5349adb071d0a56375102c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -186,6 +186,8 @@ enum platform_inst_fw_cap_type {
>   	LAYER5_BITRATE_HEVC,
>   	REQUEST_SYNC_FRAME,
>   	TIME_DELTA_BASED_RC,
> +	ROI_PARAMS,
> +	MB_SIZE,
>   	INST_FW_CAP_MAX,
>   };
> 
> @@ -197,6 +199,7 @@ enum platform_inst_fw_cap_flags {
>   	CAP_FLAG_CLIENT_SET		= BIT(4),
>   	CAP_FLAG_BITMASK		= BIT(5),
>   	CAP_FLAG_VOLATILE		= BIT(6),
> +	CAP_FLAG_CUSTOM			= BIT(7),
>   };
> 
>   struct platform_inst_fw_cap {
> @@ -206,6 +209,8 @@ struct platform_inst_fw_cap {
>   	s64 step_or_mask;
>   	s64 value;
>   	u32 hfi_id;
> +	const void *p_array;
> +	u32 elems;
>   	enum platform_inst_fw_cap_flags flags;
>   	int (*set)(struct iris_inst *inst,
>   		   enum platform_inst_fw_cap_type cap_id);
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index a945992f63aa8a0c40b8d6bc473d0bc90270e6cd..21ba9639d17b2c64e8fa33b4aacbd1946fc4dae2 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -498,6 +498,10 @@ int iris_venc_streamon_output(struct iris_inst *inst)
>   	if (ret)
>   		goto error;
> 
> +	ret = iris_set_metadata_delivery(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	if (ret)
> +		goto error;
> +
>   	ret = iris_alloc_and_queue_persist_bufs(inst, BUF_ARP);
>   	if (ret)
>   		return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
> index 00c1716b2747c7e840c2a3317800d83663744bf0..df97011636740be6cdfe5867f273c5f93408f570 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.h
> +++ b/drivers/media/platform/qcom/iris/iris_venc.h
> @@ -22,5 +22,7 @@ int iris_venc_streamon_output(struct iris_inst *inst);
>   int iris_venc_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
>   int iris_venc_start_cmd(struct iris_inst *inst);
>   int iris_venc_stop_cmd(struct iris_inst *inst);
> +struct iris_buffer *iris_queue_metadata_buffers(struct iris_inst *inst,
> +						enum iris_buffer_type buffer_type, u32 index);
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index fcbc60016beec693f2ce27927a09a2d51494bc38..fae3d113a9dc990f06167ee0b7fb8fab24a0552c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -180,6 +180,7 @@ int iris_open(struct file *filp)
>   	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
>   	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
>   	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
> +	INIT_LIST_HEAD(&inst->buffers[BUF_ROIMB_DELTAQP].list);
>   	init_completion(&inst->completion);
>   	init_completion(&inst->flush_completion);
> 
> @@ -299,6 +300,7 @@ int iris_close(struct file *filp)
>   	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>   	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>   	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	iris_destroy_roi_metadata_buffers(inst);
>   	iris_remove_session(inst);
>   	mutex_unlock(&inst->lock);
>   	mutex_destroy(&inst->ctx_q_lock);
> 
> --
> 2.34.1
> 

