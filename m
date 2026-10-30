Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370491;
	b=eDHDmQqpTtC5A0olG/BpCAlsnd+YSUHEfN53vs5HIHBpm+zgB5qqwi/Y9sVamnGje3F6
	 CC4/51HIwwb9ujtyald9d7htrk2MfPqbW/esY0DuP/iTt8QZu7okmzs8I4pBscecBUaqy
	 aNvTQ2qDydUgKEie4AIrOrlChZV5QALdjC1Ijee2HG3RiwJ9Krzv+6GPFik41s37tNO53
	 HLV3+6O9CraHAOlI7ZQkJh++t78/V8sVJ1KsRyciXOdgQliOu+XX3dkZkkVXnKZBn7dX3
	 4eVB4eHAiqwCVUXXxQB/Y3GjnQJkd79oQiQfoJZigyvxeIPTznYLOHDaD+Hu6cfeO3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=jb0UUIPqHeTvqxXRmuce2uufcIVFotyqcoN9aAY32/w=;
	b=t6ZxaWnnMPX4NH0NpRqboEskk/CTPIcVpnvi+KyjR6U8ydsZaAk8QzraX+wHRjX14ERT
	 VVexi/G7ju8mGC7PdlZCTFNOb0bhJeodeki3cWWpixubTOJEEinMxJixS7cXq66WPaDdP
	 tX/RIQzsIIBGDJtdN4B5GcSB3NXoQdTOMCCEd6T3bWto6TUBrrkhD2Fq2oEK/zYy6P4B4
	 3MlhtOFeLioZ53xNUoTA5ovafSBS4EfooOvTo7QkL4tlN00r0TatPDrDwDJkMSTswl8s9
	 ei03VpOk7rIVW+fDbrE+tpTb83OBhjKOPoJJMzL48WTK8PLMJFa47cMYCuIAb9bFwYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jmCuwfAH;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD60C606A31D
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 14:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD60C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jmCuwfAH
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so5688675e9.2
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793370488; x=1793975288; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jb0UUIPqHeTvqxXRmuce2uufcIVFotyqcoN9aAY32/w=;
        b=jmCuwfAH1CPTN8+mXIj6qPJx442DYL1aTnIIIWOVWiZegQVRIFn3R9Rmlu+wVFk/Q1
         qjr0GyO6OYqSG+JpENqWyICsbWea0t4k+e8bfeh63CwkToIcFD9Lc+5Pl88NM4vjtkdA
         hOlaadfDH7CaA5sQzJj9gHFemWBXIocfM+pzIWAOWpTKjlrBaOaZuIVuJTZ7N5H5WHW+
         KLESNqOfJk4VztQGyiobnxzEORUCO9NINvql6Y0jjVEs/8OkRe6i2s22zRDkydoQtmSi
         WPlaTz+IjyJRCxWtLoBVqUUlEgynmw/XJ78hh/5U9KHq4zrG0HOJT8R06SP/mYZL8KGL
         YXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370488; x=1793975288;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jb0UUIPqHeTvqxXRmuce2uufcIVFotyqcoN9aAY32/w=;
        b=k/6NEUemaaI0oPRWSeBJM5B6R/inw2hun6ulvUu8WReFPsA6NYjJEQSdEgCiT3/GiU
         liPAS+/Lt1JcUNt3rot34/iUo4+5Wqqp1BBS2HeQxrZlaovuQtbbLBwkQDeFZKxDNm8t
         UvyYEGKxB58DvW+yomE+I1zDx0Dys56asZFq9H8Lv4md8AoKlSHbx1UR7v4AJBG4aEw7
         ztpwak9juIiiiwaEmd1VvtlGv3zNXd8PzxsEc+x2+a8apprzX4EyC01bCXRD0lwz/x3k
         YwTqYTRJXwNpUycYeYNHuG58TSgoDr7kfeZBzH63qtsUHeiWspNuDB0WQRV4623XMOej
         dC/w==
X-Forwarded-Encrypted: i=1; AKwUvBwU+CmizTwJdXmK0l1E3p9LhWG0veMquHgZ779b6b5xHL1VV5NxqOE6NHamRSqGJodZZfI9CaoYZsRzOQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLA4yTDFG8Kefv/ZGj639z47qYKRGES0yxPd74Br6O0wSwXqRAz
	oIq4jPMusV2GmEKtqaZeY+aIlSHGkCf7OwFuLnJkQwR5HiHVj50VCzcvFgNeExodMJE=
X-Gm-Gg: AYBFou3h3nngAzq1iDQ4W0/Tm3v+FIjX/XDXkB8NLfP8r1SKWAWJuOg1EbkmD6vywj3
	1ZLIKHVMGxQ1Kdb68bz5pJYbEA40Qpb1Xfu2ZNcDcwtwusYiXhjKq33qd71+UY84rVxupfBd5Yg
	DLjOTK1YSJzDO6dff8LWKvG/iKsvGg3uIcwChOaiiPP9Rhbi1WiU2BbDguykWifNVibjiPTaDpW
	PBJdrMPJDi5/eucpfH8svv2amGLZEkrsyl14aJm2HzPgk+tq/MOIPJ4zXk6SYODJ/UhzQcPc0lz
	TsEtP9fZlmP2AnOlNvv+fWKxeQiGoWUIK79gI58EE8Ucl8K6+FGJMu8Bdv5xhgZyff+6qurvqWr
	upxzGU/TQLuEPtnpp2XsWzzCAk2HKEkY9PtfrfjupujTp8InOpMn2eMnHiauf+T7U2VpZ8AeMC0
	zkWumoqrWoBRvM4YkzHcl/0BJDORSay/uXfE/EEgrfGrqywqahaLw/5JoQMlm3odrYV2zv3dc8a
	a60PdYtNzPHFvBmHY8sO7kD9gwqEhWTMV81iLx7ut3H3kprOoPvuOXyHgN4DJtXIei3/JDBzgRs
	tSJR44X9GeAVDvwhThgtp7QW2SIYXsjEjMNgh2Vc/udPuVZQz9a8AOSePNcMfRTTZu0Rzv733RL
	yRZjj/ByOQ5gnKhf9Uxu8d+XxQ23Z6q2DwQ3fV2hmCHHDbUiHvS1hJJintRmDUn9JsQHY0MA=
X-Received: by 2002:a05:600c:8b63:b0:4a1:f688:a5d5 with SMTP id 5b1f17b1804b1-4ac187a7655mr51642025e9.23.1793370488309;
        Fri, 30 Oct 2026 07:28:08 -0700 (PDT)
Received: from chomik.local (ory90.internetdsl.tpnet.pl. [46.170.50.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm53158235e9.4.2026.10.30.07.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:28:07 -0700 (PDT)
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v12 0/6] Add Amlogic stateless H.264 video decoder for
 S4
From: =?utf-8?q?Wojciech_Biega=C5=84ski?= <wbieganski@baylibre.com>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
Date: Fri, 30 Oct 2026 15:24:06 +0100
Message-Id: <179337024629.131241.9227206619077693683.b4-reply@b4>
X-Mailer: b4 0.15.2

Hi,
I tested v12 series on AQ222 board with v7.2-rc1. Firmware version:
'v0.4.ff.I0c83495.75444b3' build 'Thu Apr 16 18:18:55 2026'.

RAW NV12 frames at the decoder output were visually OK across typical
resolutions and H.264 profiles (main, high, baseline) with and without
B-frames in the stream, also with I-frames only streams. I used Gstreamer's
(ver. 1.26) 'v4l2slh264dec' element on Trixie with both mmap and DMA-bufs
buffering (on the capture queue only). Input bitstreams where
FFmpeg-generated (testsrc2 + libx264) or publicly available test videos.

Decoder (and the output) remained stable with simulated (non key) frame
drop at max resolution (1920x1088, noise generated by FFmpeg's bitstream
filter).

The performance at max resolution, tested with 'filesrc ! parsebin !
v4l2slh264dec ! fakevideosink' pipeline was ~85 fps (fixed number of
outputted frames divided by the total execution time).

Tested-by: Wojciech Biegański <wbieganski@baylibre.com>

