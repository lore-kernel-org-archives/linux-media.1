Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434289;
	b=ewiUZ7LyeiNATZWWKkirs9sxExXkbEqCcKswqXJVfbRBvr1+lYaFUT1tf3DMTGQSwmgi
	 uhbPCvqOc0eGIJKCNepFt1HEnzqiSNY3P+k4sV5chFPvhuqgt6/nmkLFRlU6v53phXANd
	 KImLeHHm8Dlf6PG7CYU/Gr/IJuL2Sqfp3G+dODwS/3lhyXwUo3Y+ELKMbAc6dtO7Hwatk
	 8Sy7Ry7lwkTdoh9K2XRt7QXHJjw6W9TmUncXs6qTPwZZ1zJFgtERA5fPIW1HEcQMDGP/g
	 KWcJlhc2KCafhoX5hemyohLVqAktbmK2Et5dYx4OaI3iV9/lbvm0j+EKj/RTZCL+xYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7AqszT9JK11llslLQymtoeL6/CVsiRkIvN5VK7Yksp8=;
	b=5BBOtnWs0U/YSGTmfBEJ6BN2uFhU0Y+ElTBOBpp2wAllcgafghXEL264H2Xk9j5uR049
	 mHFw6LeJWMaU/gzTZgaBICmZcu6Lm/M/9grIqHHQRZl2E5EB9TZGboGQSCGIF9iqyoy4P
	 GRj5Rtyp0Ukw69dIYCesjF+qTDhqYjjFs8qBxj6hgnn5iho3jvwrrwy8lDHoq26FfaJR0
	 7sDNAhhU7yRmwWxcueON7GIVzH68J9HSkuJA4FK2Y7su1RgZB6Xta2Wqswqlx2D4mVld7
	 may/kpS3RVxnFti0pRmo7TRFggP0zvkjlQ4Sd8UAzmTT78fsOarcsE2+9YAuqZUD3tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AAEQoXKH;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99734606A31F
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 18:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99734606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AAEQoXKH
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so18487975e9.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 11:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434288; x=1793039088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7AqszT9JK11llslLQymtoeL6/CVsiRkIvN5VK7Yksp8=;
        b=AAEQoXKHc4qVf2HIjiQ8hLWltD/WNmxMWjj8qt5UwN5hy1+/yKrcck/VhWskWsunqF
         yo0007HiGPNS/iWFOfPU+uMkVzFV0mVFotObqlrQ2gGZ1h5uzaOtd/PZAvrllk3OKRkO
         H0N/htnBfc9Th6zrFhkmNfUNHTOSduebN3AKmub6tijY53xDOZwxBXoXLyJnUkvACQu2
         z8f9zH3xplsg9qACQcCSLXriJf66GOnJZb4HrOCvyTuUJ1c+zEEZw8pWQy+Xje2QmB3o
         isUsgzbXIR3XQwRcpIrTdp+wNcw0rWutNAbNpJR7cLXoOL/M1OBQW7JSRiSMfkm4wo1d
         nkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434288; x=1793039088;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7AqszT9JK11llslLQymtoeL6/CVsiRkIvN5VK7Yksp8=;
        b=pr5iZ7ijiXmSIwfGJV+xLAGKtakL56UEqT8e0Lrc3y3t/DLMqdwDIqV6vVbS7EDpoj
         xtnt9oGqCMV54ePcrAbNB3nF6skn0zm4thORRzSwgjuN2IwUFUu80Egwh685/ZcyJSVM
         sGGoUcjDVIEJzfXu2CUWA1O8UAfNy1m1s2LDkknOJRWqURq1lSLHSNNsnWMjQVXvFqfE
         qgMhPYzujluxCRDo1rUqtgRCRtESKievA2E3eFma94MYu6g4Pey0e5Y3Huf/6xb73pGM
         ALu4BkgIj6HPfkVp0aae6wOhz+QSyJSh0aPwp8pY4QJ+lQRhZz0pJg7wtQqz12z9iIDi
         77FQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQm3Ogpwm76wGV2EUzQZd7zfxEdcodzK0wSklKSIXQdJoAiej6csHADtCMsoKMpUCYcnx4x5bV1WBPPw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKhmuvTRxH60OCF5C2ZjAnc4qSX0z786goIGvLhm+q0nwVougfI
	T/34CB+BZnR2Vse7uXbR4yu3sjlqYQIDPXNPKVfxNpPX/tiquEKsGa5j
X-Gm-Gg: AYBFou3Yugm1mBDI2CpFdd0M6wjze6iqKY3P2i4UTqHS3PMU1Xwag8/AfxkMWnpJ6ii
	Wdx+N4l2hhsWL6X2p6dgGzOPCIGU3pT/NEkib9QeJLWsebOCDcD0/OKbK1mZH9NlrSj3oUu3sik
	Wl552VWZdSn3Q4N7QogNnvE64x3B5PmVnDDJSVl2eB51S5D0H3BEs8rOCivypGHggc0dDl1lGKX
	WCl0mDNd22M2UqzxZhoCC2QQ3Tao5Enlc5U8OLuJKg5cCyxZ4AODmu4Rin/cPV4JPh6uYnPJSh5
	c/9xFSK0l2HLB4T+9B+43bzUupri3wYFF2/1qQrjdCl+huZS4jaLYAgWYnGjdUWM9lFnAJE0eZ7
	heBeDYqFubM9nVl/G0GIp2aBFHgicTWk4AKkL81+rXnTpcdfHfU1EG74TM5Kw5R3/CfDpmsoPnA
	6Chj03E+McZSlPF4VFnZzC6IPdWZpk8USjOT48rpLXmz/t4wclKH2ZY/ZOvMomissc13VX1F/d2
	1+rnNPZAcHLIw8y7bZfHf2MvZ87ANnrLRZPkQq+x8KFH22916YJHjaUDguYOxdMWVR9/MIcdMQ=
X-Received: by 2002:a05:600c:4684:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1d76001e9mr174049105e9.16.1792434287773;
        Mon, 19 Oct 2026 11:24:47 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6db78csm613743f8f.2.2026.10.19.11.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:24:47 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	Hao Yao <hao.yao@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Date: Mon, 19 Oct 2026 19:24:45 +0100
Message-ID: <179243379000.31842.4735750009847702427@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019162722.25587-3-lsa.uz@pm.me>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-3-lsa.uz@pm.me>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Oct 19, 2026 at 04:27:50PM +0000, Sergey Lebedev wrote:
> The clock tree is computed from the input clock and the one link frequency
> the endpoint gives, as in vd55g1. The MIPI rate must be an integer multiple
> of the input clock, or the sensor would run at another one, so any other
> link frequency fails probe.

Thank you for posting this. I tested v1 on the Snapdragon Surface Pro 11
(X1E80100), where the endpoint is 420 MHz link frequency (840 Mbps) with
a 19.2 MHz xclk.

As posted, patch 2/4 fails probe at the integer-multiple check because
840 MHz is not an integer multiple of 19.2 MHz.

For a test only, I removed that rejection and left the rest of the driver
unchanged. The sensor then probes, the CAMSS media graph completes, and
capture delivers one complete 644x604 Y10 frame. A continuous five-frame
capture then times out waiting for frame 2.

The 1200-pixel line length below 900 Mbps is already present in this
standalone driver, so this is not the earlier line-length issue. I also
tried the ST one-lane OIF_CTRL value 0x81; the behaviour was unchanged.

For comparison, Peter's generalized vd55g1 series, with the 1200-pixel
line-length fix, streams continuously on this same machine with the same
19.2 MHz xclk and nominal 840 Mbps endpoint setting. Whether the sensor
internally rounds that rate is a separate question, but rejecting the
configuration outright prevents this Snapdragon model from probing.

There also appears to be a second difference to narrow down after the
first frame. I'm continuing to bisect that and will report the exact
cause/delta once I have it, so I can't give this a Tested-by yet.

Best regards,
George
