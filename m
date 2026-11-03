Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738482;
	b=OZ+MOjjq7yOgDDQJ8zAwgBbtKH9t33DD4fzsjAw6vYnHoOfUph3qNGUPMsodQK3VYF96
	 O/GGognizivFBLGZSuz+jukwRErK6NKgrsh4h1Qi3m0VeLfexsxU4eyNCv+DCENRrP6Ow
	 r1fGO2WQgZhXyEigoZPi7VyctqNBi7WehMtyy6d3DN6HWvcaY9DVzOinWYQFhTOvsVItt
	 R3PZhQxQegnKktFkIAWrB4CGseO5Sgsn34/N8O52itThupt/tTudEU9HybL7F5y53W/Cp
	 T2AhJAUh5HbmJPW9fM0DL+PQGJ2rCt364MEjJFfg8/Q9gYzCNLsq1m07xdDknGU0+rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738482;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=/PjxnNynwhPyqBcW3/4v6U0tENs2YaGsGX7lW9XNqmc=;
	b=pJ10t7NEw/TAqNwnsnV68LOGbrdNkRxr8LM9Vv9u5Z88+fjP9lZvitaFQfoMuvSsMmEe
	 Fu5N+RkZAGcQdHdtcR7+PKAUsogM84GGvlhq9uq4QrLESTDn2Q1fZmG/oE9oJ7RE8z1wF
	 iCRlG1kC1WL3KjQLjPFokQy3gQT0ZwA6Z8gNKkzE0Md3HQHUaRUcSttqO/UOsIb7BJL+W
	 62GtgmtVL8vi1YFfq0WpWBhc3KiBP1oNouH9wR1JA3FMDd7x9yUzJzypWyNa18XGI1ben
	 leqtFuMFBWimBMPaDTQ2k9QfrL/Y6mv9SRPAmgpfQBAmMbP7rBHHmBuAsxwTvzFMjoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DNXikazi;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418D1606A31B
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 20:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 418D1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DNXikazi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793738481; x=1825274481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dmzalwnnAYFDmr5PJb/3zaDsWuseTgdyH4vAanaNVRk=;
  b=DNXikaziz8hI+FwuHAUSbMGeVSDCJtOugUs2UkJwsiiwcopgY/0YxFhQ
   gkdId1pI2RGdhhBryIoTlEBBGM4gse55CEImMKKnG5CTw8VaR6Br54HkJ
   uZG5VZhHeLooC9MgKlkO8FxXNLixJ79aXfTegwQisHD34syk7LRLMvOmf
   ukaLMMbO8THO8bm+jkZPj24xqxH7bWj7iQOurYUaZxm3aqhA0MwCwFrJ3
   w4Gj5ZD65WF9Tq8uVGrZEjASkeNLdBbFDUzzDI0y9hUl4x9403ht0kvs3
   da3q7+Wo6PcHR5DF5d1Qom+O0Wv0/5IDDRvASOsEwOJNUk5UGI2KFdZS2
   w==;
X-CSE-ConnectionGUID: KpyZqhnQSuSPARho/QFwfg==
X-CSE-MsgGUID: eEkIlg/6TXWTEtrkQaRtyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2508480"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2508480"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 12:41:20 -0800
X-CSE-ConnectionGUID: SI3LYxs6T8W+q9eMvBU5Gg==
X-CSE-MsgGUID: kAzLE9imT4KYHUIFwOukTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8302976"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 12:41:17 -0800
Date: Tue, 3 Nov 2026 22:41:15 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 07/12] media: ipu6: Add IPU4P ISYS firmware
 operations
Message-ID: <aupG6-9xxEum35KP@ashevche-desk.local>
References: <Jmj6noRGE-pr4vr97B1H6Qt2u2m3wHDQvZF0tOg9fMulZS1SrNHgIFVW-y2bx0wwnnd6FHLIL1oaKmJ9_57yTU_pedSW_Ni9-R8IJUqaoek=@proton.me>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Jmj6noRGE-pr4vr97B1H6Qt2u2m3wHDQvZF0tOg9fMulZS1SrNHgIFVW-y2bx0wwnnd6FHLIL1oaKmJ9_57yTU_pedSW_Ni9-R8IJUqaoek=@proton.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 31, 2026 at 12:35:24PM +0000, Ruslan Bay wrote:
> Add IPU4P-specific ISYS operations for queue setup, stream
> configuration, buffer submission and response handling.
> 
> Adapt the common ISYS code to IPU4P's stream limits, CSI port mapping
> and IWAKE proxy controls.

...

> +#include <linux/atomic.h>
> +#include <linux/bits.h>
> +#include <linux/bug.h>
> +#include <linux/cacheflush.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/io.h>

> +#include <linux/kernel.h>

No way this driver uses this header!

> +#include <linux/list.h>
> +#include <linux/minmax.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/string.h>
> +#include <linux/types.h>

Please, follow IWYU principle. Reread the whole file and check what's exactly
is used. But don't go too far with that. We have some shortcuts — using
types.h for many things and not just bool definition, for example.

...

> +	token->payload = lower_32_bits(dma_mapped_buf);

wordpart.h

But if Sakari is correct and the above check is not required, this also not
needed, you may assign directly.

...

> +	do {
> +		usleep_range(400, 500);

fsleep()

> +		ret = ipu6_fw_com_release(fwctx, 0);

> +		retry--;
> +	} while (ret && retry);

	} while (ret && --retry);


> +	if (ret) {
> +		dev_err(dev, "Device release timed out: %d\n", ret);
> +		isys->fwctx = fwctx;
> +	}
> +
> +	return ret;
> +}

...

> +static int
> +ipu4p_fw_isys_fwcom_cfg_init(struct ipu6_isys *isys,
> +			     struct ipu6_fw_com_cfg *fwcom_cfg,
> +			     unsigned int num_streams)
> +{
> +	unsigned int max_send_queues, max_sram_blocks, max_devq_size;
> +	struct ipu6_fw_syscom_queue_config *input_queue_cfg;
> +	struct ipu6_fw_syscom_queue_config *output_queue_cfg;
> +	struct ipu4p_fw_isys_fw_config *isys_fw_cfg;
> +	unsigned int num_message_queues;
> +	unsigned int max_streams;
> +	unsigned int i;
> +
> +	max_streams = min_t(unsigned int, isys->pdata->ipdata->max_streams,
> +			    IPU4P_ISYS_MAX_STREAMS);

No min_t()

> +	max_send_queues = isys->pdata->ipdata->max_send_queues;
> +	max_sram_blocks = min_t(unsigned int,
> +				isys->pdata->ipdata->max_sram_blocks,
> +				IPU4P_NOF_SRAM_BLOCKS_MAX);

Ditto.

> +	max_devq_size = isys->pdata->ipdata->max_devq_size;
> +	if (!max_streams || !max_sram_blocks)
> +		return -EINVAL;
> +
> +	max_streams = min(max_streams, max_sram_blocks);
> +	if (max_send_queues < IPU4P_BASE_MSG_SEND_QUEUES + max_streams)
> +		return -EINVAL;
> +
> +	num_message_queues = clamp(num_streams, 1U, max_streams);
> +
> +	isys_fw_cfg = kzalloc_obj(*isys_fw_cfg);
> +	if (!isys_fw_cfg)
> +		return -ENOMEM;
> +
> +	input_queue_cfg = kzalloc_objs(*input_queue_cfg, max_send_queues);
> +	if (!input_queue_cfg)
> +		goto err_free_fw_cfg;
> +
> +	output_queue_cfg = kzalloc_objs(*output_queue_cfg,
> +					IPU4P_N_MAX_RECV_QUEUES);
> +	if (!output_queue_cfg)
> +		goto err_free_input_queue_cfg;
> +
> +	isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_PROXY] =
> +		IPU4P_N_MAX_PROXY_SEND_QUEUES;
> +	isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_DEV] =
> +		IPU4P_N_MAX_DEV_SEND_QUEUES;
> +	isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_MSG] =
> +		num_message_queues;
> +	isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_PROXY] =
> +		IPU4P_N_MAX_PROXY_RECV_QUEUES;
> +	isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_DEV] = 0;
> +	isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_MSG] =
> +		IPU4P_N_MAX_RECV_QUEUES - IPU4P_N_MAX_PROXY_RECV_QUEUES;
> +
> +	/*
> +	 * The GDA has 128 physical pages and a virtualization factor of 32.
> +	 * Partition the virtual pages evenly across the message queues.
> +	 */
> +	for (i = 0; i < max_sram_blocks; i++) {

	for (unsigned int i = 0; i < max_sram_blocks; i++) {

> +		if (i < num_message_queues)
> +			isys_fw_cfg->buffer_partition.num_gda_pages[i] =
> +				(IPU4P_DEVICE_GDA_NR_PAGES *
> +				 IPU4P_DEVICE_GDA_VIRT_FACTOR) /
> +				num_message_queues;
> +		else
> +			isys_fw_cfg->buffer_partition.num_gda_pages[i] = 0;
> +	}
> +
> +	input_queue_cfg[IPU4P_BASE_PROXY_SEND_QUEUES].token_size =
> +		sizeof(struct ipu4p_fw_isys_proxy_send_token);
> +	input_queue_cfg[IPU4P_BASE_PROXY_SEND_QUEUES].queue_size =
> +		IPU4P_ISYS_SIZE_PROXY_SEND_QUEUE;
> +
> +	input_queue_cfg[IPU4P_BASE_DEV_SEND_QUEUES].token_size =
> +		sizeof(struct ipu4p_fw_isys_send_token);
> +	input_queue_cfg[IPU4P_BASE_DEV_SEND_QUEUES].queue_size = max_devq_size;
> +
> +	for (i = 0; i < num_message_queues; i++) {

Ditto.

> +		unsigned int queue = IPU4P_BASE_MSG_SEND_QUEUES + i;
> +
> +		input_queue_cfg[queue].token_size =
> +			sizeof(struct ipu4p_fw_isys_send_token);
> +		input_queue_cfg[queue].queue_size = IPU4P_ISYS_SIZE_SEND_QUEUE;
> +	}
> +
> +	output_queue_cfg[IPU4P_BASE_PROXY_RECV_QUEUES].token_size =
> +		sizeof(struct ipu4p_fw_isys_proxy_recv_token);
> +	output_queue_cfg[IPU4P_BASE_PROXY_RECV_QUEUES].queue_size =
> +		IPU4P_ISYS_SIZE_PROXY_RECV_QUEUE;
> +
> +	output_queue_cfg[IPU4P_BASE_MSG_RECV_QUEUES].token_size =
> +		sizeof(struct ipu4p_fw_isys_recv_token);
> +	output_queue_cfg[IPU4P_BASE_MSG_RECV_QUEUES].queue_size =
> +		IPU4P_ISYS_SIZE_RECV_QUEUE;
> +
> +	fwcom_cfg->num_input_queues =
> +		isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_PROXY] +
> +		isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_DEV] +
> +		isys_fw_cfg->num_send_queues[IPU4P_FW_ISYS_QUEUE_TYPE_MSG];
> +	fwcom_cfg->num_output_queues =
> +		isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_PROXY] +
> +		isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_DEV] +
> +		isys_fw_cfg->num_recv_queues[IPU4P_FW_ISYS_QUEUE_TYPE_MSG];
> +	fwcom_cfg->input = input_queue_cfg;
> +	fwcom_cfg->output = output_queue_cfg;
> +	fwcom_cfg->dmem_addr = isys->pdata->ipdata->hw_variant.dmem_offset;
> +	fwcom_cfg->specific_addr = isys_fw_cfg;
> +	fwcom_cfg->specific_size = sizeof(*isys_fw_cfg);
> +	fwcom_cfg->dmem_syscom = true;
> +
> +	return 0;
> +
> +err_free_input_queue_cfg:
> +	kfree(input_queue_cfg);
> +err_free_fw_cfg:
> +	kfree(isys_fw_cfg);
> +	return -ENOMEM;
> +}

...

> +	do {
> +		usleep_range(400, 500);
> +		if (ipu6_fw_com_ready(isys->fwctx))
> +			return 0;
> +		retry--;
> +	} while (retry);

As per above.


> +	dev_err(dev, "ISYS firmware failed to become ready\n");
> +	ipu4p_fw_isys_close(isys);
> +
> +	return -EIO;

Why not -EBUSY or -ETIMEDOUT?

...

> +static void
> +ipu4p_fw_isys_dump_frame_buf_set(struct device *dev,
> +				 struct isys_fw_msgs *msg,
> +				 unsigned int outputs)
> +{
> +	const struct ipu4p_fw_isys_frame_buff_set *set = &msg->ipu4p.frame;

> +	unsigned int i;
> +
> +	for (i = 0; i < outputs; i++) {

Make it one line.

> +		const struct ipu4p_fw_isys_output_pin_payload *pin =
> +			&set->output_pins[i];
> +
> +		dev_dbg(dev, "output pin %u: buffer ID 0x%llx, address 0x%x\n",
> +			i, (unsigned long long)pin->out_buf_id, pin->addr);
> +	}
> +}

...

> +static bool
> +ipu4p_fw_isys_complete_pin_response(struct ipu6_isys *isys,
> +				    const struct ipu4p_fw_isys_resp_info *resp)
> +{
> +	struct isys_fw_msgs *msg;
> +	unsigned long flags;
> +	u64 handle = resp->pin.out_buf_id;
> +	u8 pin_mask;
> +	bool found = false;
> +
> +	if (resp->pin_id >= IPU4P_MAX_OPINS)
> +		return false;
> +
> +	pin_mask = BIT(resp->pin_id);
> +	spin_lock_irqsave(&isys->listlock, flags);
> +	list_for_each_entry(msg, &isys->framebuflist_fw, head) {
> +		if (!msg->ipu4p_is_frame ||
> +		    msg->ipu4p_stream_handle != resp->stream_handle ||
> +		    msg->ipu4p_frame_counter != resp->frame_counter ||
> +		    (handle && handle != (u64)(uintptr_t)&msg->ipu4p.frame))

Split.

> +			continue;

		if (!msg->ipu4p_is_frame)
			continue;
		...and so on...

> +		if (!(msg->ipu4p_pending_pin_mask & pin_mask))
> +			break;

Kernel should not use uintptr_t, find what Linus T. said a couple of years ago
about this.

> +		msg->ipu4p_pending_pin_mask &= ~pin_mask;
> +		if (!msg->ipu4p_pending_pin_mask)
> +			list_move(&msg->head, &isys->framebuflist);
> +		found = true;
> +		break;
> +	}
> +	spin_unlock_irqrestore(&isys->listlock, flags);
> +
> +	return found;
> +}

...

> +static bool
> +ipu4p_fw_isys_complete_skipped_frame(struct ipu6_isys *isys,
> +				     unsigned int stream_handle,
> +				     unsigned int frame_counter,
> +				     u32 addrs[IPU4P_MAX_OPINS],
> +				     u8 *pending_pin_mask)
> +{
> +	struct isys_fw_msgs *msg;
> +	unsigned long flags;
> +	bool found = false;
> +	unsigned int i;
> +
> +	*pending_pin_mask = 0;
> +	spin_lock_irqsave(&isys->listlock, flags);
> +	list_for_each_entry(msg, &isys->framebuflist_fw, head) {
> +		if (!msg->ipu4p_is_frame ||
> +		    msg->ipu4p_stream_handle != stream_handle ||
> +		    msg->ipu4p_frame_counter != frame_counter)
> +			continue;
> +
> +		*pending_pin_mask = msg->ipu4p_pending_pin_mask;
> +		for (i = 0; i < IPU4P_MAX_OPINS; i++) {
> +			if (*pending_pin_mask & BIT(i))

NIH for_each_set_bit() from bitops.h

> +				addrs[i] = msg->ipu4p.frame.output_pins[i].addr;
> +		}
> +
> +		msg->ipu4p_pending_pin_mask = 0;
> +		list_move(&msg->head, &isys->framebuflist);
> +		found = true;
> +		break;
> +	}
> +	spin_unlock_irqrestore(&isys->listlock, flags);
> +
> +	return found;
> +}

...

> +static int ipu4p_fw_isys_send_proxy_token(struct ipu6_isys *isys,
> +					  unsigned int req_id,
> +					  unsigned int region_index,
> +					  u32 value)
> +{
> +	struct ipu6_fw_com_context *ctx = isys->fwctx;
> +	struct ipu4p_fw_isys_proxy_send_token *send_token;
> +	unsigned int timeout = 1000;

No, it's not timeout, it's number of retries.

> +
> +	send_token = ipu6_send_get_token(ctx, IPU4P_BASE_PROXY_SEND_QUEUES);
> +	if (!send_token)
> +		return -EBUSY;
> +
> +	send_token->request_id = req_id;
> +	send_token->region_index = region_index;
> +	send_token->offset = 0;
> +	send_token->value = value;
> +	ipu6_send_put_token(ctx, IPU4P_BASE_PROXY_SEND_QUEUES);
> +
> +	do {
> +		struct ipu4p_fw_isys_proxy_recv_token *recv_token;
> +		int ret;
> +
> +		usleep_range(100, 110);

fsleep()

> +		recv_token = ipu6_recv_get_token(ctx,
> +						 IPU4P_BASE_PROXY_RECV_QUEUES);
> +		if (!recv_token)
> +			continue;
> +
> +		if (recv_token->proxy_resp_info.request_id != req_id)
> +			ret = -EIO;
> +		else if (recv_token->proxy_resp_info.error_info.error)
> +			ret = -EIO;

Don't you want to convert that error into Linux errno?

> +		else
> +			ret = 0;
> +
> +		ipu6_recv_put_token(ctx, IPU4P_BASE_PROXY_RECV_QUEUES);
> +		return ret;
> +	} while (--timeout);
> +
> +	return -ETIMEDOUT;
> +}

> +		goto out;
> +	}
> +
> +	switch (fw_resp->type) {
> +	case IPU4P_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_SKIPPED: {
> +		u32 addrs[IPU4P_MAX_OPINS] = {};
> +		u8 pending_pin_mask;

Copy it to unsigned long and...

> +		unsigned int i;
> +
> +		if (!ipu4p_fw_isys_complete_skipped_frame(isys,
> +							  fw_resp->stream_handle,
> +							  fw_resp->frame_counter,
> +							  addrs, &pending_pin_mask)) {
> +			dev_dbg(dev, "No in-flight frame set for skipped stream %u frame %u\n",
> +				fw_resp->stream_handle, fw_resp->frame_counter);
> +			goto out;
> +		}
> +
> +		for (i = 0; i < IPU4P_MAX_OPINS; i++) {
> +			struct ipu6_fw_isys_resp_info_abi skipped = {};
> +
> +			if (!(pending_pin_mask & BIT(i)))
> +				continue;

...use for_each_set_bit().

> +			skipped.timestamp[0] = fw_resp->timestamp[0];
> +			skipped.timestamp[1] = fw_resp->timestamp[1];
> +			skipped.stream_handle = fw_resp->stream_handle;
> +			skipped.type = IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_SKIPPED;
> +			skipped.pin_id = i;
> +			skipped.pin.addr = addrs[i];
> +			ipu6_isys_handle_response(adev, &skipped, false);
> +		}
> +		goto out;
> +	}
> +	case IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_SKIPPED:
> +		if (!ipu4p_fw_isys_complete_pin_response(isys, fw_resp)) {
> +			dev_dbg(dev, "No in-flight pin set for stream %u frame %u\n",
> +				fw_resp->stream_handle, fw_resp->frame_counter);
> +			goto out;
> +		}
> +		break;
> +	case IPU4P_FW_ISYS_RESP_TYPE_FRAME_SOF_DISCARDED:
> +	case IPU4P_FW_ISYS_RESP_TYPE_FRAME_EOF_DISCARDED:
> +	case IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_WATERMARK:
> +		dev_dbg(dev, "Ignoring IPU4P response type %u for stream %u\n",
> +			fw_resp->type, fw_resp->stream_handle);
> +		goto out;
> +	case IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_READY:
> +		if (!ipu4p_fw_isys_complete_pin_response(isys, fw_resp)) {
> +			dev_warn(dev,
> +				 "Unmatched IPU4P pin response for stream %u frame %u\n",
> +				 fw_resp->stream_handle, fw_resp->frame_counter);
> +			goto out;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	type = ipu4p_fw_isys_resp_type_to_ipu6(fw_resp->type);
> +	if (type < 0) {
> +		if (type == -EINVAL)
> +			dev_err(dev, "Unknown IPU4P response type %u\n",
> +				fw_resp->type);
> +		else
> +			dev_dbg(dev, "Ignoring unsupported IPU4P response type %u\n",
> +				fw_resp->type);
> +		goto out;
> +	}
> +
> +	resp.buf_id = fw_resp->buf_id;
> +	resp.pin.out_buf_id = fw_resp->pin.out_buf_id;
> +	resp.pin.addr = fw_resp->pin.addr;
> +	resp.pin.compress = fw_resp->pin.compress;
> +	resp.error_info.error = fw_resp->error_info.error;
> +	resp.error_info.error_details = fw_resp->error_info.error_details;
> +	resp.timestamp[0] = fw_resp->timestamp[0];
> +	resp.timestamp[1] = fw_resp->timestamp[1];
> +	resp.stream_handle = fw_resp->stream_handle;
> +	resp.type = type;
> +	resp.pin_id = fw_resp->pin_id;
> +
> +	/* IPU4P manages message-buffer ownership separately. */
> +	ipu6_isys_handle_response(adev, &resp, false);
> +
> +out:

This looks unneeded. Just make another wrapper where you just get/put token and
call this one. And here use simple return 0; directly from the switch cases.

> +	ipu6_recv_put_token(isys->fwctx, IPU4P_BASE_MSG_RECV_QUEUES);
> +
> +	return 0;
> +}

...

> +	ret = ipu6_isys_fw_pins_prepare(stream, desc, ipu4p_fw_isys_pin_cfg,
> +					cfg);

In such a case it's okay to have 82 characters line, and a single one.

> +	if (ret)
> +		return ret;

...

> -	ret = ida_alloc_max(&csi2->isys->streams, IPU6_ISYS_MAX_STREAMS - 1,
> -			    GFP_KERNEL);
> +	max_streams = min_t(unsigned int,
> +			    csi2->isys->pdata->ipdata->max_streams,
> +			    IPU6_ISYS_MAX_STREAMS);
> +	if (!max_streams) {

This check can be done before calling min(), right?

> +		ret = -EINVAL;
> +		goto err_free_stream;
> +	}

...

> -	if (IS_IPU7(isp) || IS_IPU8(isp)) {
> +	if (IS_IPU7(isp) || IS_IPU8(isp))
>  		ipu7_isys_setup_hw(isys);
> -	} else {
> +	else if (!IS_IPU4P(isp))
>  		ipu6_isys_setup_hw(isys);
> +
> +	if (!IS_IPU7(isp) && !IS_IPU8(isp))
>  		set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
> -	}

Instead you can just add

	} else
		set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);

if I'm not mistaken.

-- 
With Best Regards,
Andy Shevchenko


