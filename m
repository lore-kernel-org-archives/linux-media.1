Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793141076;
	b=P3L1nysYxtZzD+LKMaAjP1vStMkTCaJZIBSJmbtBCJPSK2iYlFyPbzHK89EFKoHdUTwW
	 RKNlvPj731myMKElAHYvcO2IHDO1H+ML+iXmVSu17bf8tjVQWsQAOkHy3aIpDBYkFkRre
	 dvi6YMczNp+EwnXuJNnB0kDpMZl9dvcwPe3mjP5tsliFJK78dGbY6Zs0iv92GlpMSHbtp
	 em4ZsRlZFogbb/ocatQShhyr9et/JikqSf0CxWhmzGJ9WVsX33uNynOKaB1KIRlWHFJLX
	 iTMNFWELiP0QdtUF+cXMBUel7ErD+sSmbzyG8YY5x8oB8I0WAXuCWxRGmImjXaF1iiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793141076;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rJO7rSe9eLqzFXmbbsuCfMtpPVfF/GMPvzghtsTBDCU=;
	b=cZKrtRvKzlkCp3fsRKFZODTkesqEtL4vLk5QE79kdBI+TJOSEprRU1aupINaD42jf5R4
	 7iLZo7XcaS/pSXEPQhlMKP6qG0dkRF2obpsyogz7gToIPupNSxXHJXe8Bmk4wf+I+PZpu
	 AocncbiRDgdNxP3voOhUVgGrVxG02XkDa9KaiXalnbpBw/fnMQey9+eRQeZYJ45CeuA2E
	 yhseCeEtMu2xF+bUw7KOn0YgsXWMUq91lU9gbs4EKe8l1xyRtGyZQXWmRqyny0Eng2MkM
	 Dm1CceBOLrgjZGIWLVTJZJmxS+UmmpNcYqLgVwKoQ+XHJed76LJwl2GrgzCLcDGZysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GojsxI3h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64A5606A31A;
	Tue, 27 Oct 2026 22:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GojsxI3h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464471F01825;
	Tue, 27 Oct 2026 22:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793141075;
	bh=rJO7rSe9eLqzFXmbbsuCfMtpPVfF/GMPvzghtsTBDCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GojsxI3hCpZtttAdK3MIvfpu80WQCB5lsatKlIvifYvu1L/4m1RrMcqO125KORlDT
	 0BRYsyhwSvsVo9uShqCas1lvIQd+feOiHSQtkbWQ0bLX6BR2pmsnVde4sGEV0BkOpR
	 cel2GOR9fCv2ff96bU65tEw4Htg3PNx5RltP0Rg3e1tZ4vzWau+goQ94E+7E7AzJPA
	 lVgWEL/YINmpSRKxd66CdsGpvMwSpDJniSQBUv8A3XiJbxTAZ6hrBUP4XeXXnbxGUH
	 nKUzOtbxCw2fKg0rupggaoMBk8tt8a0lxiSTyNQ3E6JBliiE/yR6Lh1YnDt/679XCz
	 jJfKD50lOe2hw==
Message-ID: <7ee16d85-9cc2-48a0-ab38-3eb131c6282f@kernel.org>
Date: Tue, 27 Oct 2026 23:44:32 +0100
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
Subject: Re: [RFC PATCH 3/5] media: iris: Signal V4L2_EVENT_EOS only at the
 end of a drain
To: Christian Cortner <ccortner@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Birk Skyum <birk.skyum@pm.me>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
 <20261027021934.22113-1-ccortner@gmail.com>
 <3m0nX8uY072pf3fCrsvbTIMw_7hAaOyUSSCQSUBMwviYGnMBOVkNnJR5fTde258Lm8YY6PrvlqvlmTrFk1AbHw==@protonmail.internalid>
 <20261027021934.22113-4-ccortner@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20261027021934.22113-4-ccortner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2026 03:19, Christian Cortner wrote:
> iris_vb2_buffer_done() and iris_vb2_buf_queue() queue V4L2_EVENT_EOS and
> mark the m2m context as stopped for every capture buffer flagged
> V4L2_BUF_FLAG_LAST, including the one that ends a dynamic resolution
> change. In the stateful decoder interface the (deprecated) EOS event is
> part of the drain sequence only, and a resolution change is not the end
> of the stream: a client that still acts on the event, like ffmpeg's
> h264_v4l2m2m decoder, stops decoding at the first resolution change in
> the stream. And since nothing in the driver clears the stopped mark
> again, the EOS event of the drain at the real end of such a stream is
> never sent.

More word salad. I'd almost drop that entire paragraph - hitting you 
with these stuttering paragraphs is !elucidating - kind of the opposite.

> Queue the event, and mark the context as stopped, only when the LAST
> buffer ends a drain, that is when IRIS_INST_SUB_DRAIN_LAST is set. Both
> HFI generations set it before they return the LAST buffer of a drain,
> for the decoder and the encoder alike.

This is much clearer.
> Fixes: 84e17adae3e3 ("media: iris: add support for dynamic resolution change")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM sparse smatch
> ---
> Reference only, not for merging (no Signed-off-by); see the cover
> letter.
> 
>   drivers/media/platform/qcom/iris/iris_buffer.c | 7 ++++++-
>   drivers/media/platform/qcom/iris/iris_vb2.c    | 4 +++-
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index eb8de60c1177..ff2a1b331ac2 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -913,7 +913,12 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>   	}
> 
>   	if (vbuf->flags & V4L2_BUF_FLAG_LAST) {
> -		if (!v4l2_m2m_has_stopped(m2m_ctx)) {
> +		/*
> +		 * Only a drain ends with V4L2_EVENT_EOS: the LAST buffer of a
> +		 * source change is not the end of the stream.
> +		 */
> +		if (inst->sub_state & IRIS_INST_SUB_DRAIN_LAST &&
> +		    !v4l2_m2m_has_stopped(m2m_ctx)) {
>   			const struct v4l2_event ev = { .type = V4L2_EVENT_EOS };
> 
>   			v4l2_event_queue_fh(&inst->fh, &ev);
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index 8faf709c26c1..b820b3e43910 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -324,7 +324,9 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
>   			vbuf->field = V4L2_FIELD_NONE;
>   			vb2_set_plane_payload(vb2, 0, 0);
>   			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
> -			if (!v4l2_m2m_has_stopped(m2m_ctx)) {
> +			/* EOS ends a drain only, see iris_vb2_buffer_done() */
> +			if (inst->sub_state & IRIS_INST_SUB_DRAIN_LAST &&
> +			    !v4l2_m2m_has_stopped(m2m_ctx)) {

Adding the flag over and over again is pretty mindless.

Add a function or wrapper to capture this logic - we had functional 
decomposition in the previous patch - but distinctly lacking here.

=>

$ grep -r v4l2_m2m_has_stopped drivers/media/platform/qcom/iris/*
drivers/media/platform/qcom/iris/iris_buffer.c:		if 
(!v4l2_m2m_has_stopped(m2m_ctx)) {
drivers/media/platform/qcom/iris/iris_vb2.c:			if 
(!v4l2_m2m_has_stopped(m2m_ctx)) {


>   				v4l2_event_queue_fh(&inst->fh, &eos);
>   				v4l2_m2m_mark_stopped(m2m_ctx);
>   			}
> --
> 2.56.0
> 

