Received: from mail-oi2-f2.google.com (mail-oi2-f2.google.com [74.125.231.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AD72472AA
	for <linux-media@vger.kernel.org>; Sun, 30 Aug 2026 02:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788055304; cv=pass; b=rNs9Mkfl5vB78VMjjnIP/rEmMnZvoVMMy/MYcrtuLVuSQp+jw+KIFyNNJpnHcB5f05EdhTUwadRGG+7N05lZTUT27PHA9zru7OfRuTkicRO+odHAph8jnKg/vhp5gKUFOGTk7BggNjxDozzYnxotbCKzr44LCFIzXzsko+BF2jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788055304; c=relaxed/simple;
	bh=6XOymjcSjWubZwLEdxGedBY3LnWQ+Ks9qj5cDmVh2UU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rl5rGLIa4IH2ajopoMOnEdoESTD/jx9P6m4PFn77Gsa2ZfzSAOx/HJ4XPgQ1bHxXcaFN7fcVpQrBEvy+GwKKCEtvMRaTATKXIEzm1a9m/mQfrGqjgDr2LNfHdt2FT3nU5HGPcEIA1v+ruEU28Waa1vlDvNzRadjxgwHh/czhf+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFcAhEXs; arc=pass smtp.client-ip=74.125.231.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFcAhEXs"
Received: by mail-oi2-f2.google.com with SMTP id 46e09a7af769-7f4e9ec63a7so759912a34.1
        for <linux-media@vger.kernel.org>; Sat, 29 Aug 2026 19:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788055302; cv=none;
        d=google.com; s=arc-20260327;
        b=RNH2bbtjefB9KQxFdsy8rKSGJ2yI6AjEGKEPXWnacacNOtaYA7/j28MBsaRTGrOJAl
         EzWpNXFVsZ+LmR16H7Xwf8e7mMQPx6nafKsQyES4NBMO2Gjr6HDP7ksUJm6Fz/RmAcTz
         6JpyUYeW9MZbKGNHenzoX0/Bzt8hR+6xFI+zyzkQvXL4p4SrYPCmRVyzsEQVTi053KNh
         /Askabjx4ZmHLq35RtWXarxya3mQonMiu1g4PK3XMVgvIT1BHiIFXkN0jCXfDLe2umXH
         4xa+YSGvpg6c3xZtquqXZxLsw3deHNpevQSot+2DIlXhMyzqBnCwMYdzqODOfAv0h2ZW
         fGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6XOymjcSjWubZwLEdxGedBY3LnWQ+Ks9qj5cDmVh2UU=;
        fh=OVbvNZ0AXRnipQsW2sPw3iXVq+RpqUlVfsles50+T6E=;
        b=GizwpNGFUjjVHnaJgVALsSbz+wgZZIuiZW1VoFZ5so9bQGIbiH736Oib68YfFPg9lz
         chOKk7VeJiFpq4EQzkH5VdkSA5yQ3etMl9+wLrBP2xsHWXaHakGemPD0qm/J4KUL7lVB
         ltbh941kwcbl7jl63toa+evTjgDfMJ4NtxgLgbbkICVLG5q/AV0gZl/lPnhV8x8s8Uvi
         1XSqgMHzh+RujxEF32MHC4pVocp1bW87CnaiW2TF+QXOtNNfIoIzzXK2UowsNNdIplfQ
         O3GZpPD/nFTd7bt6qOKRfxAJ0zTOcOZaK1R1ymt+rWJDp1o8n/BkoWEX4S186siQUgBF
         we7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788055302; x=1788660102; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6XOymjcSjWubZwLEdxGedBY3LnWQ+Ks9qj5cDmVh2UU=;
        b=XFcAhEXs24uI+CzAKLVDlyhSGSoVGmqtIdfIKd4sXqcxCkUCv9yRRnJO3dPqEZjjNi
         XzyW5jNMhWHsaJZmoFYP5+ZqukZjcdO0fj/eEgu4wX1m1/RncJWwDPwLGpbeVvo90wtO
         Az4td3zc2S0JjL1eWqZel6DVfsp//EVsWkILP4U5XE8lMtVSREifyrj2pTkTJGqA5srY
         WDSfrpt4UDyBkWbvefXWE40Zc53zcZsm4iayh7GYqvDZQdO/qUAYbwOg6OiPQ1vTzBQq
         0p4Qtvac4dWe0jRAU1ebj0a6SnHuIeu+MopPMwt1qKN1Jl/GAJNym1Uk9bdDM4rC6q35
         Kwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788055302; x=1788660102;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6XOymjcSjWubZwLEdxGedBY3LnWQ+Ks9qj5cDmVh2UU=;
        b=X/M20VQfQezpScOldxlNOVzhenrlErpmd4MToqMmdcZgn3ixoU8oG9pBBEpkP7YGoE
         8XkqeuXDQY73n33E32pKmGJhV41mv7nBcJgpGN5FK4Bo3ZmbeodIN5y0P377S1PHPpND
         27jtAD4AwUa344CkVNOZpdhkblebhVkhOLzy9bwqR8xMygAMFavkbZjpoxBtRi7y25oE
         XaKubiZVlaJnEaTCL6sbyBceq1DENPjhUW874wrFUmcrOROE7OW/aSojFY+kX5FuIOR6
         5ijWTS/fMA6Y7o2boMdX29XZDXjY0VaCfpHIxBYndYh1DMlTS9a51tcVnL8RI+1K+igE
         OEiA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4pKhAiBy5x4+RDGmfltHqKYBeL7BauZ+NeGI4KjnPb9ZdhxcQVbBivdBaiYeMzLbLJq1LV5FmngVNrA==@vger.kernel.org
X-Gm-Message-State: AFuF++msCOKmnGUrRRwzXjFFpideWckOip6z7JSmoB1g0203NO+vSEq0
	ZQqTs45NLRWSbAdUKxxn2p0yKik77kNS9x1VZDOrGXGwLBZ+5L2Pi4G5iZSQLbo3y9GpOGKQ9mF
	Rg5Uj3jhgRfa0RD+vllp4+MyI+4Amifw=
X-Gm-Gg: AR+sD10KYNfiH9OygseBB4gPOKGDyra6whmqAi5GGu+nZdipSPhJm0vbLCVeA7hWnWe
	Bl5u0BezALVAmXdmeqcUASJUtcetR6O2dFUU0i2Kl9iYLqSP6+rQsRayNm99jnMWAsKtNaQnXky
	ZALIZn3agQobDE0nN65PfGtjeoBTBidHVqgC6Hc11CImtZbKs1qC77slSDPtQnP+3aPKiJFvNJC
	w1cwhNXN+JIle0gwgxCp/rpQoEuyX3MUfsMGscT4aYS9o8xwuf773xEo7T/zVIDs26aXw/kmxD2
	VAaW3dZX10Gx5baQLsNBN+Gsk6Z6Mn69+a+MKfPvCdx93/RIoH09+jw8qFH5bWfy3UN5/+B4teC
	ZYt4=
X-Received: by 2002:a05:6808:178e:b0:4b2:b653:87ff with SMTP id
 5614622812f47-4b39803b2ffmr20583581b6e.7.1788055301793; Sat, 29 Aug 2026
 19:01:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729011001.16999-1-dennylin0707@gmail.com> <22f01d3e-85ad-43ec-aa01-e5f3eced8703@oss.qualcomm.com>
In-Reply-To: <22f01d3e-85ad-43ec-aa01-e5f3eced8703@oss.qualcomm.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Sat, 29 Aug 2026 19:01:31 -0700
X-Gm-Features: AcwNN1WiAb0Q13f1dUbx3G0x5k62j7uinaHZOIU1052lWkiaCapBUbdu9a4BAPw
Message-ID: <CAGEkeHdG2KkyR3ZV8aB31Ymcsg==Qyyqf3Jbyg+XJu4CvfLjOw@mail.gmail.com>
Subject: Re: [PATCH v6] media: qcom: iris: move OPP handling to VPU power transaction
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This is an existing "issue" in the driver

Thanks for the review.

I understand that iris_opp_set_rate(0) only selects the lowest OPP
and does not actually drop the performance-state vote, which is handled
when the device runtime-suspends.

I will keep the OPP ownership change in iris_vpu_power_on() separate from
this existing behavior. Would you prefer the actual OPP release to be
addressed in a separate follow-up patch?

Thanks,
Hungyu Lin
