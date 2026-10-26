Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793053890;
	b=n3+eXi0n/X8fYpY+He1ZKjuSRx+5jnOxdhPwTMWFCHVbzdmmlGfuUc4mE/G7Rzt6/mKS
	 WG1+0gRD9UXAafpbOUayMVx82G8ypiXgV1/vVzU30RpC+6V/ZR6BvJa1M2Anq0JaTbAyR
	 KrYpjDhhWOZtb5oX7+q0A4Rai9P+E0jVPnrIkv7i1OZVhMTXUPRUGRWHOPpuxvXtlxdrD
	 Wu6rDxh/Wc5oSdtGLvfxx8WWXmhl7NHSgypMZQBSL4thdynKLvvvNHdD6ic9I9otyfDcw
	 Hvk7DHN8Ibs3QzxLZjI4DYv9XtzJoivRueLLIoR2qWAtBZ7vCduT/0pO2UycGKIN4Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053890;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bm7pxB9Xf4alx215LCgrX0zaAVDW0Og4H2ZZv6R0v+4=;
	b=mBYYC0nfSyrtkbz0eOT5hifPeTheJUBYYU2vUcclQbmcvumFqEW4Lkj+RBg73OB7WOAE
	 VQFNLcsQ7jBG9v0QyD2rU5lPf4w0Dg8qlCoUNeJ1E4iXNFDc5qffDrRsyyyPjf64iEKMy
	 G/xgFHkegnGpEjeVdE/znb4r5zqHpbN2SkMq6sZ9IRmf6Y6Y8KL9NEWettRXlnJxkNhBZ
	 pWwoRB/qcwdnXbCGD8rkKyekSfnkxhHCTgxayoATFcD0w/kqL5sRwYONGVoe7EXSkhejl
	 DMnSqUiRGqJqA7HQ2Jf/EKR5vOcnPE/Jo3G89NKbQOqmESvFtQsVA72P8elid0/1nrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IElEfE0B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8182606A31D;
	Mon, 26 Oct 2026 22:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IElEfE0B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3EC11F01825;
	Mon, 26 Oct 2026 22:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793053889;
	bh=bm7pxB9Xf4alx215LCgrX0zaAVDW0Og4H2ZZv6R0v+4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IElEfE0BdHc2/HJOZuPaa7j68zJlv5I3F0d6PLZRRyVW5KS68tgMSruFdMp35j8w7
	 7DENCwZq+B4tPLsJskvIZdc9vzQT5ApUh96OAqFnLs4G7+t4W5eS4LxahT31UDgAAr
	 VwMvgGN87eKTU5bpJEXo/k0uZ72ScMe+2OB+diELbSFrEr6rcfb1iagvvsMyoX83EF
	 hLcTe/fjVrmIdI873caQpVRlj7V+VJSX3BSj6p3U1nJKJ6svciBjAbex7b2BnQSIbk
	 VkhNqtVxylN5VR93ep8FjAeE4od4kAuDoYYU0iFVQ7mQnl7t9cc6Qd3KLCZsGrLkZ9
	 fnlxf1JtCQq4w==
Message-ID: <36201ae2-1cee-4d8d-9381-dfc9013c522e@kernel.org>
Date: Mon, 26 Oct 2026 22:31:26 +0000
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
Subject: Re: [BUG] media: iris: resolution change handling stops ffmpeg's
 h264_v4l2m2m decoder on glymur
To: Christian Cortner <ccortner@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Birk Skyum <birk.skyum@pm.me>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <NKVWOXEaC2RjmCRG3wt6Y-1_CZxSqp_rpkiLIJV8xQg9k4sZGi5C2lZ4oIQ0qsI-Fk-wDDfmYsiCOiqKaDFnzQ==@protonmail.internalid>
 <20261026160952.22082-1-ccortner@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261026160952.22082-1-ccortner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/10/2026 16:09, Christian Cortner wrote:
> Hi,
> 
> On an ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite / glymur),
> ffmpeg's h264_v4l2m2m decoder outputs one corrupted frame and stops,
> on every stream I tried. GStreamer's V4L2 decoders work. Below are the
> two driver behaviours behind it (1 and 2), two more that stop ffmpeg
> at a resolution change in the middle of a stream (3 and 4), and an
> inconsistent CAPTURE format that ffmpeg happens to avoid (5).
> 
> I'm not a kernel developer. I tracked this down with an AI coding
> assistant (Claude, by Anthropic): it traced the driver, wrote a small
> V4L2 test client and tried changes to the driver. Everything below was
> run on this laptop, and each local change described made its problem
> go away here. I can't review or defend kernel patches myself, so I'm
> reporting the problems instead of sending fixes, but I'm glad to test
> patches on this machine.

Err thanks for the bug report but, if you have a test-case and a 
resolution - even of the code sucks and/or you don't understand it, 
please post the code.

One of us can take up the task of finishing it off.

After all we are burning down the rainforest for this stuff so no sense 
in wasting the already spent compute time and power.

---
bod
