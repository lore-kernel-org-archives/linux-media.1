Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864139;
	b=JgFYDSx/lbwpUHDft5b9xhvwqHrOcn02Sqpg9ljOl5bZ473gCJ6nGgE3dqvc1tDXS6K9
	 XG4lRz7+Dy84eO9ahLIyK5jLu1SpUDFGbAihe62EbbVKzAldnChzYdvxoJAk23s8h+k8Y
	 xlxSOStrSqHCZ/nKnPuL76HHkChuSwlfCkmBSuRt8U/qmzMFS/lzIqDvvW9rlDFk1A/0J
	 dmZot3RPQr5PFsk1XSoXW1K+Ki2ZRWTfhZO2Q7MFzZr4qRyp8RIjwAkBsGdq8cIGSkd/c
	 MFqS6GTmHDJuNPi7pwV3Q0kus2Z4pAY6OSFiV4soCuu9JlZkDD+xTY2QVZs4J0jOoxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=sJbfjHwLUTndWZHf1I31qfbGZOpPu211U7CheHU9eZ0=;
	b=RPc9Qp2+pSfPBCKB+1lvZer+pNRtMBDJlLxG1hAzsMya/vq3HmbVfGeP3XM0GZR4xD/j
	 ywq4TRVloeiNcP7tg1p6eKjNkJrZqj2KYEk/wSemOEDsfm50YGhyLItXQ+RuwsNtgGVBU
	 jMTa4q1eVE0M/SkHOTI8HuYw1WyZkczA7l2zFYJ/p3Uq9zkQfZAYDMMhgfReUKXxOaGkl
	 7wYzveve6/uHBZnosLWYhxbAAksR1WJIvbUWezqKZ6I3x56Bcgxi0qkmrvQ7hhsjMjy8g
	 XD58xJJwxUwQ93SAH8PGrANKc+pkvddu/Uhgh/RgLvE2dZoIdYNjwihaq8Yb5Sq3dTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fml0NyDu;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8A8606A322
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 21:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C8A8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fml0NyDu
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3548565f8f.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 13:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794864137; x=1795468937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJbfjHwLUTndWZHf1I31qfbGZOpPu211U7CheHU9eZ0=;
        b=fml0NyDuK4xOqqbN+fI7brgmiTe4BvzUncWHAL33hEJOTxY9rQ8kEGkFSaLlKY+dMd
         0UGKD4v7GTNE/oFJc+46i8YikeY/SPgj7aS12DdFBzujza2rO9Namq+HGAZZHFAxrEY7
         YNUa4rlvd3wziHuMuWl8/deLn/JNeh8FG+4T/wwD8/mdqqZt+G6VtlOy1zzlEOw2jjDR
         x3TvHxRO9wZUpG/9/jMcIhqtE36KzRFbCkbt7fqJjP99EE+CYvoSEv1SggckjMDCS5e7
         KTJ2O5vURdD+sLTUzeprgZxQcV3JfDLIpZOOfY4gv4bDBn4wNvQ3knEDHVIkOgypH8TN
         JVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864137; x=1795468937;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJbfjHwLUTndWZHf1I31qfbGZOpPu211U7CheHU9eZ0=;
        b=YUI4I2fklXiWQevfQnRssp15zOFEakKwTZRTgrRuB4YANS/yI8g4LzTaoOuLbB0VQS
         ba17TiqPbCXkWenZYoESJ0BfZhgVRFP01qDchrHE7G2hSEMYTsBjTCUuPST0eNs8F8W4
         zOdN5HXwgxyFQmsXkwhTWnGs9Xj8nGHYVokHv5z3COEHXjcKqwBlnUTMfta4r2/T2vKE
         0llBtPsKg+xXnCKqoYRNelKGv2aGWxKwiS0+7yn/+BDWBRicIlFcuJa0q5jFTJE/JuCL
         SX+JadvUVxVo3VwBlOEEy0Xly5NUo4PqAul8LQUEvp5MittVZco3qGF/5JhvLXNutV/P
         pFZg==
X-Forwarded-Encrypted: i=1; AL+hErE+xywFtqheCXWU0eq/ZpkBnw3nrG3pHozfR4b3UomM4bNu/0alHcsNKQKY9gb88yGfQcKh/Sviv5Y2sA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y7cre4Wj7dDmqZ+SEuHpL6U3fix9T24Dw6CJAFEvf8syyuq8k
	gxVhsLcNglCPHXQ/+ooHxkXgV1PKKcqQwXRxgjbd3VQrtaJbkiJ9+mSs/ud4nJsqgyY=
X-Gm-Gg: AZFdTZc8rZWLPqOh5KEwT3cA/i3zjXL32w5pp4abvT/PJ2ldzvmJtFBUIEe5I8SQnvJ
	qZn7jxW6cq7a/MqmsR3SVJTWKglg5qwpfd+wcQTWtKbJUR1spQATQq72ECM4UNOFNO0auQf8WW7
	KEINXbPIMCLIzJ6oLxqmGXJ/D5qURnBYoUqMtYjrf5rDR0k1iiBppj5T+co/V1WTImYGE0piPEn
	m27CTsU1w7BpvcLjr1tSLYigeMBB5XF2HCwK3x1S1Cj5EfkANwuvLITgQaMaQrjqXila+XzZodr
	3CETkC1zgqp3wVs4qsscy2A3hFQFGhAmUdn3R4n+pBsK5C7kuXFi9bBPJGnxz1ooYRY5TVNZsAe
	Dh3yaXPX+1Dcw4mlHgu33tg2nvtnbC7uwGiKQEjYQNMzMXB2jkiAdnV9pmZXwnZSy6JakX6eYoc
	Y5kbVQ6jhX4huBwXY94BmUOQGFB+mcGQxWvtmIza21UJkS6Egxcl9SxJQJfS8q0VgTlH/c7RUrc
	Z2zKQED8giv1YCnNz4SAALbZ4pan5I67bfyfF9OY8jrWLWEEqlwwMHXezeVKFcujWYGiQNwKYlu
	VEnwYkOBQKrOUf/ZaKpNf5DTUmocc0mHHmqX7l+paaKvBmQVY0Q=
X-Received: by 2002:a05:6000:4284:b0:492:820d:5e6 with SMTP id ffacd0b85a97d-49c72ba6660mr30296893f8f.49.1794864136472;
        Mon, 16 Nov 2026 13:22:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm23832144f8f.35.2026.11.16.13.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:22:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zhentao Guo <zhentao.guo@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
Subject: Re: (subset) [PATCH v12 0/6] Add Amlogic stateless H.264 video
 decoder for S4
Message-Id: <179486413508.1210949.15857134761629837585.b4-ty@b4>
Date: Mon, 16 Nov 2026 22:22:15 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Thu, 22 Oct 2026 13:26:58 +0800, Zhentao Guo wrote:
> Introduce initial driver support for Amlogic's new video acceleration
> hardware architecture, designed for video stream decoding.
> 
> Compared to the current Amlogic video decoder hardware architecture,
> this new implementation eliminates the Esparser hardware component,
> enabling direct vb2 buffer input. The driver is designed to support
> the V4L2 M2M stateless decoder API. The initial phase includes support
> for H.264 decoding on Amlogic S805X2 platform.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (for-next)

[1/6] firmware: meson: sm: video firmware loading via secure monitor
      https://git.kernel.org/amlogic/c/fe6c77ab883ecbbcb2d4731a2a5d883a9efbea30
[2/6] firmware: meson: sm: Add video firmware loading SMC call
      https://git.kernel.org/amlogic/c/a47962dfcc5a924d3b824ec7acf56c0c654510b8

These changes has been applied on the intermediate git tree [1].

The for-next branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

