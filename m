Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181617;
	b=i8L8cHF3SdEsYNKCLso//5hccF9RYESJBzc8AIOBeSQF1+8eFS0KdGQuJDPEl5W3jizw
	 EE0lIl2W7SsF2aOBowgdmA9RLBOxks5mynfOa8e81xUJQWaCpyd6o/Cyo4+PGknYpw9WV
	 bK+yTHkPI+yzQ1Wm4pm6Gk5vdAxM6kjF99CoBNftTkqWNgsuvWOKFBc3e4X0e18M9vvq+
	 i6BHovsS5PdOUkjVpzDjZPammnASZlR2/708wC+GQT+6YJu/A7/F/yuecHeCmmykf6osl
	 QOWmhJ6atH9rcQVj14gIqfG3nl59hDL38XHHK3zqEUoYr+SJ00pYDrFO6yW2BdzUl6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181617;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=s5fN7zqfY0FT1clO7TLSZQSrDeAgwSiZ8frqUs18I+w=;
	b=hVJXCkaWRUFyQVNcRWQI74Rz43USTeZXlfz2nRg6rM0NZn5Hv2DWedi975wtXCLxx/Yv
	 Kh8LeCmMc2p/8myIB7VPgEn17fT6aE7kzquIE22fA1z7QlGWO0CeYo+jWU7sWMUYgowK4
	 W9/u+mGVbbpPoovr1kW44eHlEv+VYI6a2J7N6eQtPBp14/SrUX5yprvTsB3bIxoqFrr4l
	 EnSQPz9IdiitfROqZmKGp5UcP+faKh63VGqxZxIXIdnSKijuUKwrHRgKeANRwyu+Wxi+w
	 BR32MGn1kA3Ze2pBzUvjQK4Jx8GjnlxLwizohWYRVoAUT/eEPXP4hM/VTS69Q4PyDdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VREr7TVD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F5D606A31D;
	Wed, 28 Oct 2026 10:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VREr7TVD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0894D1F01825;
	Wed, 28 Oct 2026 10:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793181616;
	bh=s5fN7zqfY0FT1clO7TLSZQSrDeAgwSiZ8frqUs18I+w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VREr7TVD5CF7eXhkDuIrS0jvFsTToXJQ1D6dX3B9ctvGLS2GJDAfl+Llmut+NVSgC
	 7xl+i8jOrBIOKUm+zj859JULbrB7CSAI4mdOEteaIGg8EAKlZBIPxFo0NhF8gW9dV5
	 bQ0l80qDVMpSfIqycysPDfsaCPRe2YVRCmTvHGyv14A5HeHTH/9ZdXKwUXxkyDQR3O
	 J6FjkPq9I6ws5p5CoJ5AKUCDRm0pMxWy9RQQYL8J122ss4rlDmHUCce/l1Jt73uaFb
	 qKNvDLdJC49GBwGBynIKutNr5y+QFnaqFLfWwgrVaYxaOszFi0W0J6m9XRVH7S0D3f
	 FT1YvbaeWI/DA==
Message-ID: <6ae04312-5c60-40f9-8468-4cb0674c0949@kernel.org>
Date: Wed, 28 Oct 2026 10:00:13 +0000
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
Subject: Re: [RFC PATCH v2 0/4] media: iris: decoder fixes for resolution
 changes
To: Christian Cortner <ccortner@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Birk Skyum <birk.skyum@pm.me>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <-D3aZIsoO4_H5CdnB-7Co7GWmm5F9FuU6aFuhXWogBXhfqNOaqC2Y8tkBxT9ljDcy84UAX1jmUWGl7NtGUG6Mg==@protonmail.internalid>
 <20261028034335.26075-1-ccortner@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261028034335.26075-1-ccortner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2026 03:43, Christian Cortner wrote:
> Four fixes for iris decoder problems at resolution changes, reworked
> after Bryan's review of v1 [1]. There is no Signed-off-by from me,
> since I'm not a kernel developer and can't vouch for the code; please
> take over whatever is useful. An AI assistant wrote the code and the
> logs (Assisted-by in each patch). I'm happy to test.
> 
> Tested on glymur (Zenbook A16, laptops tree 65f4ae73 with these four
> and the iris patches listed in [2]): v4l2-compliance passes, and
> GStreamer and a spec-following client decode bit-exact across
> resolution changes. ffmpeg's h264_v4l2m2m still stops at the first
> source change when it sets up CAPTURE early (problem 1 in [2]).
> Build-tested on media-committers next with W=1, sparse and smatch.
> 
> Changes in v2:
> - 1/4: shorter log, with the traced firmware flags (Bryan)
> - 2/4: shorter log (Bryan)
> - 3/4: one helper for the EOS check (Bryan)
> - 4/4: comment states the 500 ms limit, no domain check, warn on
>    timeout (Bryan)
> - v1 5/5 dropped: too much for stable, and broken (Bryan)
> 
> [1] https://lore.kernel.org/linux-media/20261027021934.22113-1-ccortner@gmail.com/
> [2] https://lore.kernel.org/linux-media/20261026160952.22082-1-ccortner@gmail.com/
> 
> Christian Cortner (4):
>    media: iris: Don't flag an empty source change LAST buffer as an error
>    media: iris: Update the CAPTURE stride and size on S_FMT(OUTPUT)
>    media: iris: Signal V4L2_EVENT_EOS only at the end of a drain
>    media: iris: Let a resolution change drain before stopping CAPTURE
> 
>   .../media/platform/qcom/iris/iris_buffer.c    | 26 +++++---
>   .../media/platform/qcom/iris/iris_buffer.h    |  1 +
>   .../qcom/iris/iris_hfi_gen2_response.c        |  7 ++-
>   .../media/platform/qcom/iris/iris_instance.h  |  3 +
>   drivers/media/platform/qcom/iris/iris_state.c |  8 ++-
>   drivers/media/platform/qcom/iris/iris_vb2.c   | 26 ++++++--
>   drivers/media/platform/qcom/iris/iris_vdec.c  | 61 ++++++++++---------
>   drivers/media/platform/qcom/iris/iris_vidc.c  |  1 +
>   8 files changed, 91 insertions(+), 42 deletions(-)
> 
> 
> base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
> --
> 2.56.0

Thank you for your bug report and suggested fixes.

I will mark is as under-review and ensure we do Closes: and 
Suggested-by: with whatever lads upstream.

---
bod
