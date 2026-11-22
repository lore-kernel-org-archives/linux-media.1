Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388981;
	b=r5boQZFpoTH3+wCja3ijYQDjOauAI1/JYI2K69QQHJ/EzYFZQwt3ZHYfuyZbSeT2Mm/N
	 6YD0sT9cLNkOtYm8W+/dhaRTuijhjuy9Uu30UMYz+4n8lLPUnqbJKjaUbWYPqFHZCDkUn
	 EcQ2oFWs9vPFnml1u38zIPd8odxrFD7/EYRWYBOZ1wPKbXlN/jNP7cX9owcEe7q4LmQTg
	 /nFLZLNEkE4DCujaqTJxlZGE+gef5So06tbHCEXJquyEKvmwQCdrix0nEbuPi4veoh9kY
	 UdDktEaHhmhg5vHrxg7qozAutkLZjI9WNLhA4BCpsdato2JqKZ2aCVKVgmbzxtpB42w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388981;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4PVgXPRwijzJCkg5P2UlmwCaAxY+3wgWaL0TibkK/9o=;
	b=ZiLD4O5pmE/v4OOF0Tva2MB0jpJKWR/LL5jTatFE1ZOKNj6NhNoG2N8FHlPify3ueQ9F
	 IvuUU6nlTNLq9BJInBOnCypwnj6PYpytYLAYDorZ6KUWzCScZTPLZiLcrhlSh4lyRhqhg
	 5mbdp1Js/yXlo+sOS1PthpwfbAtmuFsPtH+0Rex4T147CDmwocUBXGk2mgcEen2NAojTK
	 6II9FMbIEsWuo8JIWm7Sye+DnjPX8gO4CJv5NdtwPkHKKbMdRof0OjR579MFAqesNgx6I
	 GEDnq+O9Bg27Y5nhqfppxvbxtL5sBDQoTmM81bJBJLnqMrEnfW7TN+183lQ9Q4TfI1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OLwB4wlx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8828606A31A;
	Sun, 22 Nov 2026 23:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OLwB4wlx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDB31F000C6;
	Sun, 22 Nov 2026 23:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795388980;
	bh=4PVgXPRwijzJCkg5P2UlmwCaAxY+3wgWaL0TibkK/9o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OLwB4wlxxvfTo0vz+nmeisREst1pGDpqh0PbnNQZS85V/cCdpEx1zAABE6UrWXxB7
	 6q6geNvpJhm6ejgnsSOU/LSj17EDKBWGtbwbZ+/YXMWSuvEO/4OXhWbvWdplHb0m3b
	 OvM9NGkuMU5yTBg1RdlVP7U2nPEw//fUApcIW14MdCbFc6rcUyppqoIt/Lz6mP0XSS
	 dlC7FhNVpPN7vWDvTuZQKfFWnG/tj5eUCoHU6QqTg3oV0jR7/FCUnZw4wBOw1pVw4Q
	 lEEepUlHKN1vbU72CPR42MRYzKAvAV69hRaqcZdApuh40+3kNUetGjokek6ol0mJOs
	 0dXtl01FHYSEw==
Message-ID: <bfe911bd-6642-44a7-8100-84ad6d23db04@kernel.org>
Date: Sun, 22 Nov 2026 23:09:36 +0000
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
Subject: Re: [PATCH 2/2] media: venus: vdec: Resume CAPTURE restarted during a
 seek
To: emcp@enser.io, Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261122-b4-venus-eos-seek-v1-0-2e38912c7cf9@enser.io>
 <9BBteWrtlxmVtI0GWrjHkaJY7msPwkyQSlKYzEOzgV4-PQObBN78h7LPVJDWft7qSeuqPh4CX_whiysRD8nWOg==@protonmail.internalid>
 <20261122-b4-venus-eos-seek-v1-2-2e38912c7cf9@enser.io>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261122-b4-venus-eos-seek-v1-2-2e38912c7cf9@enser.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 05:13, EMCP333 via B4 Relay wrote:
> From: EMCP333 <emcp@enser.io>
> 
> GStreamer's V4L2 decoder handles a flushing seek by calling STREAMOFF on
> both queues, then STREAMON on CAPTURE, then STREAMON on OUTPUT when the
> first buffer of the new segment arrives. On a OnePlus 6T (SDM845) the
> seek never completes: the decoder takes two OUTPUT buffers, produces
> nothing, and the pipeline times out waiting for preroll.
> 
> The driver loses CAPTURE in that order:
> 
>    STREAMOFF OUTPUT   vdec_stop_output()    DECODING -> SEEK, flush
>    STREAMOFF CAPTURE  vdec_stop_capture()   SEEK: buffers cancelled
>    STREAMON  CAPTURE  vdec_start_capture()  streamon_out is 0: return 0,
>                                             streamon_cap stays 0
>    STREAMON  OUTPUT   vdec_start_output()   SEEK -> DECODING, but capture
>                                             buffers are queued only if
>                                             streamon_cap is set
> 
> so the buffers CAPTURE was restarted with stay in the m2m queue and the
> firmware has nothing to decode into. A seek that restarts only OUTPUT,
> as ffmpeg and mpv do, is not affected.
> 
> Remember a CAPTURE restart that happens while OUTPUT is stopped in the
> SEEK state, hold the capture buffers queued meanwhile, and hand them to
> the firmware together with the DPB buffers when OUTPUT restarts. Clear
> the flag whenever CAPTURE is stopped again.
> 
> Tested on a OnePlus 6T with this change on the postmarketOS sdm845
> kernel (6.18): three flushing seeks through GStreamer's v4l2h264dec, to
> 5, 2 and 8 s of a 10 s clip, each preroll in 0.04-0.07 s with the first
> frame at the exact target timestamp, and playback then runs to
> end-of-stream.
> 
> The code and this changelog were prepared with the help of an AI coding
> assistant. The submitter has reviewed both and takes responsibility for
> them.
> 
> Fixes: beac82904a87 ("media: venus: make decoder compliant with stateful codec API")
> Signed-off-by: EMCP333 <emcp@enser.io>
This also looks similar to : 
https://patchwork.linuxtv.org/project/linux-media/patch/20260928-venus-vdec-eos-v1-2-6e9eb3ce9849@ixit.cz/

Please pick up on David's patches, give Tested-by: as appropriate and 
propose any additional fixes on top.

---
bod
