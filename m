Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793653321;
	b=tI2hci5iGPEe+gxcMh4XspJtsztj6t82U54b9TYwM9dGo++HHjj4vkEKEgtSPctIy0bw
	 TlNhkdzCWqxttZk7DxKvEDvAXTQD13TtxeB6zW4JOhLkt+M2OUPChXboajjPN/XopX+b5
	 wSBJWSFm9LF3/8fIHPkip07lCcrq72p2jNM4/6lVFNW4V7pV0Y2D+enx8yU91phCJZXoj
	 Fzy/wt7GX9BrtUKbjtG6sHJar0yQrMA/0CGXYxvTwq+M34ojJZluPCc5lmE98m3lg7z+T
	 B6K7a4BScXfiZeP9VonBD4a40/LVo1J3uaSnHRl8Nbnp0V6G5T3E9qhScIbXCGaskEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653321;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JITVABxM6trthNhA8uR61OxCoNxK7Cx+C2VvYkdcDHo=;
	b=00lyTf1PPj/ckMDTpYQAThM79kP3HR1IedyE8ymX3dl1raBPY2DYDhGo/YVAXKCvGak8
	 OzH8Dj+tCwnyxsLgKjNzf3CD+WdwzhsofPpYckBpFeM/mBVA0cu9JeTfO9ZwRaUC6vKoa
	 7Erj/PaosLC3pLq2EqmxndHT7FstFBMM05Zq72mek6xd7+ltj8lUYnQ1Ec06OokEpQVBh
	 8trs/obY9qY75s+amdlBKxB+9iiVFNKNMLDIiVRWzifo4RAifteJI87wDRzkqVi+rqjRu
	 aFDuU8PBSjIw5qh4JiVSkIrqPDajgb4FhfBw3seU4mjqJ43CcGnLke7y46euI1dskGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iZ3UNLEN;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D5E606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 21:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D5E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iZ3UNLEN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793653322; x=1825189322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=caf39fDU2dIRFBW8zz+2lQeYsWzWC14fqu/6wWVdbJo=;
  b=iZ3UNLENdqzwy60oC5aAVMET74uxdMHHjXximdamaxCpY1b19S0SQRPG
   AhNHirtO4eVaB774velBzZASpfDhxYJIf3SrpLkWWVQZAMujIUMUVyts2
   vfsxti+IctpecxO5eAf051xKXc9X9CUvMr1r2PwlhTMgFllwERn3c7ACq
   xXoqFSMlxvJ2Ss9NZPsNdUM5WvV81L9dbnA7r/EoadowpRrXJA3Gsq1pv
   9qVrGLF7SWWePlxqsR2yDWbCyxeLv5tSy7vl5xamohDzW4BDqbvBHtKv7
   Jha+M06+wXmgGCDbvpo+34zQPkiNNfjQtdUHH/IMdw2oqKJfirr5x1M0c
   g==;
X-CSE-ConnectionGUID: t+4e5kitR4iWkC7tohjpDA==
X-CSE-MsgGUID: FMIlUQOxTJafela3ICnJSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2375447"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2375447"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:02:01 -0800
X-CSE-ConnectionGUID: ewORDfr7RXe414s9lYdlfg==
X-CSE-MsgGUID: RVxkRbsAR56hfixwVj2mVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6101149"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.242])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:01:57 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C3AF511FB41;
	Mon, 02 Nov 2026 23:02:05 +0200 (EET)
Date: Mon, 2 Nov 2026 23:02:05 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 06/12] media: ipu6: Add firmware-specific ISYS
 response dispatch
Message-ID: <auj6TaUQ3A-2P3D3@kekkonen.localdomain>
References: <B4M1vUVEJG-bpgpO3B_4JKq2KUnJn56WFxEbA8byH4SjqblOQWrnG-O2WAzY-PnwccdL03yZzjS8VfD1CsZ-FFyQXbrpN3eB1K13Cp_o_Ok=@proton.me>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B4M1vUVEJG-bpgpO3B_4JKq2KUnJn56WFxEbA8byH4SjqblOQWrnG-O2WAzY-PnwccdL03yZzjS8VfD1CsZ-FFyQXbrpN3eB1K13Cp_o_Ok=@proton.me>

Hi Ruslan,

On Sat, Oct 31, 2026 at 12:34:43PM +0000, Ruslan Bay wrote:
> Route ISYS response dequeueing through firmware-specific operations
> while keeping response handling shared.
> 
> Allow the common handler to skip message-buffer release when required
> by the firmware's buffer ownership rules.
> 
> Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 55 +++++++++++++--------
>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.h |  4 +-
>  drivers/media/pci/intel/ipu6/ipu6-isys.h    |  1 +
>  3 files changed, 39 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
> index 56bb67869bd..c6066e37ef5 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
> @@ -531,20 +531,17 @@ static u32 resp_type_to_index(int type)
>  	return  ARRAY_SIZE(fw_msg) - 1;
>  }
>  
> -int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
> +void ipu6_isys_handle_response(struct ipu6_bus_device *adev,
> +			       struct ipu6_fw_isys_resp_info_abi *resp,
> +			       bool release_msg_buf)

Could the message buffer be released by the caller instead?

>  {
>  	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
> -	struct ipu6_fw_isys_resp_info_abi *resp;
>  	struct ipu6_isys_stream *stream;
>  	struct ipu6_isys_csi2 *csi2 = NULL;
>  	struct isys_fw_msgs *isys_fw_msg = NULL;
>  	u32 index;
>  	u64 ts;
>  
> -	resp = ipu6_fw_isys_get_resp(isys);
> -	if (!resp)
> -		return 1;
> -
>  	ts = (u64)resp->timestamp[1] << 32 | resp->timestamp[0];
>  
>  	index = resp_type_to_index(resp->type);
> @@ -580,7 +577,8 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
>  	}
>  	stream->error = resp->error_info.error;
>  
> -	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
> +	if (stream->asd)
> +		csi2 = ipu6_isys_subdev_to_csi2(stream->asd);

If stream->asd == NULL, what can we do here? Isn't that an error btw.? Can
it happen? I'd add at least dev_err_once() or something. But this change
still appears to be worth a separate patch.

>  
>  	switch (resp->type) {
>  	case IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE:
> @@ -606,16 +604,17 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
>  		 * firmware only release the capture message until software
>  		 * get pin_data_ready event
>  		 */
> -		if (!resp->buf_id) {
> -			dev_warn(&adev->auxdev.dev, "%d: Invalid buf ID\n",
> -				 resp->stream_handle);
> -			goto leave;
> -		}
> -
> -		isys_fw_msg = container_of((void *)(uintptr_t)resp->buf_id,
> -					   struct isys_fw_msgs, dummy);
> +		if (release_msg_buf) {
> +			if (!resp->buf_id) {
> +				dev_warn(&adev->auxdev.dev, "%d: Invalid buf ID\n",
> +					 resp->stream_handle);
> +				goto leave;
> +			}
>  
> -		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), isys_fw_msg);
> +			isys_fw_msg = container_of((void *)(uintptr_t)resp->buf_id,
> +						   struct isys_fw_msgs, dummy);
> +			ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), isys_fw_msg);
> +		}
>  		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
>  		    stream->output_pins_queue[resp->pin_id])
>  			ipu6_isys_queue_buf_ready(stream, resp);
> @@ -633,8 +632,8 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
>  	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE:
>  		break;
>  	case IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF:
> -
> -		ipu6_isys_csi2_sof_event_by_stream(stream);
> +		if (csi2)
> +			ipu6_isys_csi2_sof_event_by_stream(stream);
>  		stream->seq[stream->seq_index].sequence =
>  			atomic_read(&stream->sequence) - 1;
>  		stream->seq[stream->seq_index].timestamp = ts;
> @@ -646,7 +645,8 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
>  			% IPU6_ISYS_MAX_PARALLEL_SOF;
>  		break;
>  	case IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF:
> -		ipu6_isys_csi2_eof_event_by_stream(stream);
> +		if (csi2)
> +			ipu6_isys_csi2_eof_event_by_stream(stream);
>  		dev_dbg(&adev->auxdev.dev,
>  			"eof: handle %d: (index %u), timestamp 0x%16.16llx\n",
>  			resp->stream_handle,
> @@ -661,7 +661,21 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
>  	}
>  
>  leave:
> +	return;

No point to have a label just for this.

> +}
> +
> +static int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
> +{
> +	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
> +	struct ipu6_fw_isys_resp_info_abi *resp;
> +
> +	resp = ipu6_fw_isys_get_resp(isys);
> +	if (!resp)
> +		return 1;
> +
> +	ipu6_isys_handle_response(adev, resp, true);
>  	ipu6_fw_isys_put_resp(isys);
> +
>  	return 0;
>  }
>  
> @@ -742,7 +756,7 @@ irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev)
>  
>  		writel(0, base + IPU6_REG_ISYS_UNISPART_SW_IRQ_REG);
>  
> -		if (!ipu6_isys_isr_one(adev))
> +		if (!adev->auxdrv_data->fw_ops->isr_one(adev))
>  			status_sw = IPU6_ISYS_UNISPART_IRQ_SW;
>  		else
>  			status_sw = 0;
> @@ -958,6 +972,7 @@ static void ipu6_fw_isys_prepare_buf_set(struct isys_fw_msgs *msg,
>  const struct ipu6_fw_isys_ops ipu6_fw_isys_ops = {
>  	.init = ipu6_fw_isys_init,
>  	.close = ipu6_fw_isys_close,
> +	.isr_one = ipu6_isys_isr_one,
>  	.cleanup = ipu6_fw_isys_cleanup,
>  	.prepare_stream_cfg = ipu6_fw_isys_prepare_stream_cfg,
>  	.prepare_buf_set = ipu6_fw_isys_prepare_buf_set,
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
> index 2a679d99596..498cb7f0691 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
> @@ -562,7 +562,9 @@ struct ipu6_fw_proxy_send_queue_token {
>  int ipu6_fw_isys_send_proxy_token(struct ipu6_isys *isys, unsigned int req_id,
>  				  unsigned int index, unsigned int offset,
>  				  u32 value);
> -int ipu6_isys_isr_one(struct ipu6_bus_device *adev);
> +void ipu6_isys_handle_response(struct ipu6_bus_device *adev,
> +			       struct ipu6_fw_isys_resp_info_abi *resp,
> +			       bool release_msg_buf);
>  irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev);
>  
>  #endif
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
> index f4d00f763eb..86b1ab681e3 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
> @@ -167,6 +167,7 @@ struct isys_fw_msgs {
>  struct ipu6_fw_isys_ops {
>  	int (*init)(struct ipu6_isys *isys, unsigned int num_streams);
>  	int (*close)(struct ipu6_isys *isys);
> +	int (*isr_one)(struct ipu6_bus_device *adev);
>  	int (*send_cmd)(struct ipu6_isys *isys,
>  			const unsigned int stream_handle,
>  			void *cpu_mapped_buf,

-- 
Kind regards,

Sakari Ailus
