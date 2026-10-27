Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793141987;
	b=y2Uyg0zkiAe4tYWszNKrcRIyOxVezWyxHCAkclU8/1xoGhb3FukeXhJPbhZljdNMLYEp
	 o/YY2E12ZlkfBGIU5AVE0/uEtdZhHZsjnxK6SxVacR6TqbD0zQ6ZkXOSadXV+wdlczK6c
	 qd5ug4rjKQXZScI4hRhOTVBSpVYROCf8gytdVh3bV/OqrjMj1o++dMMdsoRYUykNGVzyu
	 HprfndkzUQL3O4pwRS41sOEkuxI7hzsO+NKVY15R1Mp5Ewib8XJhjyxanRWzZYk6gfQts
	 R06hNaCEIrNx9RMLsPGbWWU2b8/nvwbgEN7WmeP4kCHmXsGZGTlgPRf1l/Zgw1SuYsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793141987;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=cYmC/3J97HFkWzhxU66431hKLJOhJqZpSGyiNmtB1NI=;
	b=Y6LGRaOA8TwWR6gcQKnGXKMB9/jt4B5+8EMKis27bLkKq1BIpKEFOltHcFdqFIieOkLm
	 2FL7qqvNxKaTbisuhTdfEBfvjbj1LANoDIzq9sBY/f7WGW4HckFCtlgKerHBGQUydduFk
	 BR3sgeP6Mr89CPfFBanT6RUdBLuPbN+8OL7bwD8HyLPQtc9wwOzEv+++3eAb9h2r+cY6R
	 8OLLNrtduf820MGD0LeSkoUVb1N+O7md/BJ3XOznIUyf5Ovk0zwHwbDlmFEM2UkiJoLbN
	 ZfaDxXqmbxl5n8iqcxn/i1ElTr8kkYp6B+FGMTr1r0JnGldspp9+09Ha8k4ErpDmQ2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QjnfUUnY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05511606A31D;
	Tue, 27 Oct 2026 22:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QjnfUUnY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378101F01825;
	Tue, 27 Oct 2026 22:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793141986;
	bh=cYmC/3J97HFkWzhxU66431hKLJOhJqZpSGyiNmtB1NI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QjnfUUnYON3dRe5RfcC4QGn7loY7F6A8ScQ/Xnvzx3SGHgG8o3UKZJk3kOTBpxxCD
	 6fXJLZI102EXMTfknpNKK87uq0i5iS2Zb5YZcCpxZOUGmBGGyYzIw/gJQVoPBHalDi
	 EViA3kn1vYcQYFI3VS+ykUwLg0KRDb24x55Vakpb7MF1qSFHQpm6+6CLDYwszP0U31
	 6dgZsuaiN2nSZdtS6h4uGoS8n7SqyxrN8YsNT1Zph39HuuJpBrbrptKTE4LtHrW6xB
	 95vsQgVI9Sz/KtjXkmkNPdoJNuJxq5Ob5e0V7WHA+MF68vEBYDP7w8nL4w2GmClO+C
	 nHYkCPD4wqmTQ==
Message-ID: <f060a514-f7a4-4fe0-b338-2fbc661fe39a@kernel.org>
Date: Tue, 27 Oct 2026 23:59:28 +0100
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
Subject: Re: [RFC PATCH 4/5] media: iris: Let a resolution change drain before
 stopping CAPTURE
To: Christian Cortner <ccortner@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Birk Skyum <birk.skyum@pm.me>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
 <20261027021934.22113-1-ccortner@gmail.com>
 <eswPAv1JJAScTt7FYf3nEKyl1BJmDyxc3KmggxfAZE5otcdDeFDEafpXGsOmsDVzSgZGaoISpwz1ISLDOCp1PQ==@protonmail.internalid>
 <20261027021934.22113-5-ccortner@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20261027021934.22113-5-ccortner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2026 03:19, Christian Cortner wrote:
> The stateful decoder interface lets a client abort the implicit drain of
> a dynamic resolution change by stopping the CAPTURE queue, and ffmpeg's
> h264_v4l2m2m decoder does so about 10 us after it dequeues the source
> change event. If the stop reaches the firmware before the firmware has
> reported the end of the drain (HFI_BUF_FW_FLAG_PSC_LAST), the firmware
> returns all capture buffers without that flag and
> IRIS_INST_SUB_DRC_LAST is never set. At the next
> VIDIOC_STREAMON(CAPTURE), iris_process_streamon_output() then finds no
> completed resolution change and resumes the firmware without
> reallocating the internal input buffers. The firmware still returns the
> PSC_LAST buffer it owes, 1.3 ms later in our trace,
> iris_inst_sub_state_change_drc_last() rejects it because the input is no
> longer paused, and the instance goes to IRIS_INST_ERROR: no buffer is
> returned after that, and the client waits forever. Completing the
> resolution change at that STREAMON instead, by reallocating the internal
> buffers before resuming the firmware, did not help: the firmware then
> returned nothing at all.

I didn't even read the above part. Sorry like Pavlov's dog at this stage 
I'm conditioned, its going to be more than I or really anybody reading 
the log can grok, pun intended.

> Wait in iris_vb2_stop_streaming(), for at most 500 ms, until the
> firmware has completed the drain of a pending resolution change before
> stopping CAPTURE. The client's STREAMON then takes the normal resolution
> change path. The wait queue is woken wherever IRIS_INST_SUB_DRC_LAST is
> set, for both HFI generations; gen1 sets it in the same event handler
> that sets IRIS_INST_SUB_DRC, so there the wait ends at once.
> 
> Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
> Assisted-by: LLM sparse smatch> Reference only, not for merging (no Signed-off-by); see the cover
> letter.
> 
>   .../media/platform/qcom/iris/iris_instance.h  |  3 +++
>   drivers/media/platform/qcom/iris/iris_state.c |  8 +++++++-
>   drivers/media/platform/qcom/iris/iris_vb2.c   | 19 +++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vidc.c  |  1 +
>   4 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 771269e705d9..1013ed2911a1 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -7,6 +7,7 @@
>   #define __IRIS_INSTANCE_H__
> 
>   #include <linux/kref.h>
> +#include <linux/wait.h>
> 
>   #include <media/v4l2-ctrls.h>
> 
> @@ -56,6 +57,7 @@ struct iris_hfi_session_ops;
>    * @metadata_idx: index for metadata buffer
>    * @codec: codec type
>    * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
> + * @drc_wq: woken when IRIS_INST_SUB_DRC_LAST is set
>    * @last_buf_ns: start time of received input buffer for current one second FPS window
>    * @frame_counter: input buffer counter for current one second FPS window
>    * @frame_rate: frame rate of current instance
> @@ -104,6 +106,7 @@ struct iris_inst {
>   	u32				metadata_idx;
>   	u32				codec;
>   	bool				last_buffer_dequeued;
> +	wait_queue_head_t		drc_wq;
>   	u64				last_buf_ns;
>   	u32				frame_counter;
>   	u32				frame_rate;
> diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
> index 5552725c614e..dd8e0093b972 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.c
> +++ b/drivers/media/platform/qcom/iris/iris_state.c
> @@ -209,6 +209,7 @@ int iris_inst_sub_state_change_drain_last(struct iris_inst *inst)
>   int iris_inst_sub_state_change_drc_last(struct iris_inst *inst)
>   {
>   	enum iris_inst_sub_state set_sub_state;
> +	int ret;
> 
>   	if (inst->sub_state & IRIS_INST_SUB_DRC_LAST)
>   		return -EINVAL;
> @@ -222,7 +223,12 @@ int iris_inst_sub_state_change_drc_last(struct iris_inst *inst)
> 
>   	set_sub_state = IRIS_INST_SUB_DRC_LAST | IRIS_INST_SUB_OUTPUT_PAUSE;
> 
> -	return iris_inst_change_sub_state(inst, 0, set_sub_state);
> +	ret = iris_inst_change_sub_state(inst, 0, set_sub_state);
> +	/* a CAPTURE STREAMOFF may be waiting, see iris_vb2_stop_streaming() */
> +	if (!ret)
> +		wake_up_all(&inst->drc_wq);
> +
> +	return ret;
>   }
> 
>   int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane)
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index b820b3e43910..bc2f201fea0e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -228,6 +228,15 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
>   	return ret;
>   }
> 
> +/* a source change whose drain the firmware has not completed yet */
> +static bool iris_drc_draining(struct iris_inst *inst)
> +{
> +	enum iris_inst_sub_state sub_state = READ_ONCE(inst->sub_state);
> +
> +	return sub_state & IRIS_INST_SUB_DRC &&
> +	       !(sub_state & IRIS_INST_SUB_DRC_LAST);
> +}
> +
>   void iris_vb2_stop_streaming(struct vb2_queue *q)
>   {
>   	struct iris_inst *inst;
> @@ -238,6 +247,16 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>   	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state == IRIS_INST_INIT)
>   		return;
> 
> +	/*
> +	 * A client may abort the drain of a resolution change by stopping
> +	 * CAPTURE, but if the stop reaches the firmware before the drain is
> +	 * complete, the resolution change can never finish and decoding
> +	 * stalls after the next STREAMON. Let the drain complete first.
> +	 */
> +	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->domain == DECODER)
> +		wait_event_timeout(inst->drc_wq, !iris_drc_draining(inst),
> +				   msecs_to_jiffies(500));

The comment and the code are in conflict - it doesn't unconditionally 
let the drain complete. Its within half a second.

And actually why should domain == DECODER be required ?

Seems to me also if the timeout is exceeded then that's a thing worth 
complaining about in the kernel log.

These also seem like nits I'm picking. Introducing a rendezvous is 
potentially the right solution here.

Certainly warrants further thinking about.

> +
>   	mutex_lock(&inst->lock);
> 
>   	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 05aab6e3005d..0df0a5915e16 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -201,6 +201,7 @@ int iris_open(struct file *filp)
>   	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
>   	init_completion(&inst->completion);
>   	init_completion(&inst->flush_completion);
> +	init_waitqueue_head(&inst->drc_wq);
> 
>   	iris_v4l2_fh_init(inst, filp);
> 
> --
> 2.56.0
> 

