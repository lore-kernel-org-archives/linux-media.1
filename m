Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645329;
	b=JO1OlMuEyKFV3vM8RJ6YsjartQoF6wjnZH1Lrw+Ef/bHA8GOHxkRaHccgvV1+ufRjaaS
	 BXAH1iHo2ZSRz/mPeI1nHud9RTM8eqbEeKorbAuswbXWxbzpcWMmYSr6tLme4xi3/xvgx
	 XFZUjcrb4oC/PmHuUFNVUXEmmhxZ4VpGd90qzESw47P7T+60jfxLX9mFMY+hcrY1MAcFQ
	 pms2Vye3YrL/sKHrRBRbSlnCxoW+61rea6vvPgbFgIpVbgy+BJaKdjANTei2+zi/9XKFZ
	 64q3iEoQ+RsSZRWmsUaAueSyg93DCRbuRZa0OarMhKWn+9b1HB3viN1l04+3GsEymJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=C69/ffAPx0j1QcJUb+dT0EdjmFvbp1KocswjzV+VV1k=;
	b=PM5uDwJ2xHO18zGAERm1S8oVGzlku9gMOT6ZWzL4vEhA1D1g3DGpGSaJbUhIQamUbY+u
	 jgvgAtQ0f4SCHSISSLz/EZIP24ysSz9Ev7RGOnkWNfWzevk7ArbA0KMW96MowVztoakjZ
	 iVwoyxrHkBv2Rr9ESCaPA/YzCnwAQDrkHB+IMIhMGxSnAUbccwcPKXWc9JOWL+LpQdr5r
	 gG5oUtLROueTQZMWhS1Velk9RvpuBE+T1H+grVQDXavFgCs42QVsFwSL90BGFr+1swmjk
	 +xEeqat5ToS/vHyfDJswbqLmuMVsK0ryK9+Xb2wybVm+6spr1fhFbczH4Jxc3/fYsmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="YncYCro/";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD4F606A321
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 22:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CD4F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YncYCro/
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so7334186eec.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 14:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645328; x=1796250128; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C69/ffAPx0j1QcJUb+dT0EdjmFvbp1KocswjzV+VV1k=;
        b=YncYCro/L8CMeERC0hR+VfwS0kuYbUii91BfFPlkoqZ8fXCP+6UpSJeAat3eoGDH5B
         VfPf+L4KbBN2G+4qSOa/VbncwstLqkfqIsgcfTOhZ/1P9zGbRNg4Ji8iQupqOfVeVRou
         s23hTdL4ZR5j4Chp6g9guAWC5M9rDMP/pVzjze+t37zyJ2W8B89VXQT3hsAZ7orhGZTP
         uWG9Jrt9oVgiENIo1F5y64q3uizeLOIjGEBX6ekebhz9tuucPHT0M23x4SvQnCiUv8kU
         u6xC/tEnyi+i1nmF7zCXKQZuZ1v7tyP+Ce5UOq35Yr6wV0xZn1nfym1Hu7IP6KYNspLG
         h3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645328; x=1796250128;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C69/ffAPx0j1QcJUb+dT0EdjmFvbp1KocswjzV+VV1k=;
        b=HFbsqiOIhEeEcHg9Sd7zGeZ1Q737WDvPqP20rNwa4heHPxDQA7P0DWyOunNEi9Iq9d
         NKP9EyQwjULBOSLU+21WCjjGmXV4E1tF5/FWBgRcVdpSRFwGjJA77iImzuV2HsEoW7ti
         r51hb4BtDxPpuLleTpS3mAxNkK2Q6p7blIrE4AleGDDdHDpNXRSFOAZiEIkCyXwTFlSr
         8gvjPQCv+cBzVwOV/3iSTKkIQ6mBuIh5jF0oPR/CYx/G0fhW76FmHkSzgPFMa4EXMdYL
         XsASdQU96hPEpjZhFM+7UNNGrISfCBnkB+grZRNdXf5Kk+e8BnTbFL62AVbAP862nl2/
         ImGw==
X-Gm-Message-State: APuU4Z+5fOF6NakCijcjLFx4FBL6EGnItd+PhAw0wrAQW0SItSMJ/i4n
	wFxHU4lOFf9QQ4MnGmqt/BpBBcUFBPP5QA+CQF+b6XhsCTwaZBiLb6P3SdY2QZdczlNK+WJZcER
	4HA==
X-Received: from dycnb22.prod.google.com ([2002:a05:7301:b16:b0:386:af9c:96b6])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:638d:20b0:375:c862:31c
 with SMTP id 5a478bee46e88-38571816d35mr18950057eec.40.1795645328132; Wed, 25
 Nov 2026 14:22:08 -0800 (PST)
Date: Wed, 25 Nov 2026 22:21:00 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222102.1430675-1-elkin@google.com>
Subject: [PATCH 0/2] media: s2255: fix marker scan and bounds checks in save_frame
From: Elkin Cruz <elkin@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  media: s2255: validate transfer size, payload, and offset in
    save_frame
  media: s2255: advance marker pointer and use unaligned reads in
    save_frame

 drivers/media/usb/s2255/s2255drv.c | 79 +++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 29 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

