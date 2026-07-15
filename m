Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15AB44685A
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 20:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146126; cv=none; b=rhe+sQ1tJ80OttxX62aYdRVY+tFUk9Zlf7Soay1Dvxyw6BiRMvBNko7DX2QM/NZMppyRBSVyFP0OPhUQ+vH32pbH6xhvtsVz4QGYlyqVJSSdL71Xxjm1gHeln9NNLe8r0YlJUo9CFZj+7lTV3sC5xtkWcmpjq+tZaGijbhS0z0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146126; c=relaxed/simple;
	bh=gkCD81XCRKujgWuJ/o0vlSNXbZjlRz5ZS9uv5DJwxlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c2sTINuoKcObr3vHKbuMWGM0p2jfGysI9fch4rsx7Xn9aPVVunz3rPJvvtNdrL3NVLq6smq0B3ZAf4GHFuhKUzBstst7N3tZHeKY3kItVeYDJswp5wa9STH2YL8rlYyMt2sUivhYKTNnXIl5dGXpfZtCyIy3hrb/xdlFyIwdUQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUZNL7Tr; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUZNL7Tr"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-472d9d69e16so424012f8f.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 13:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784146123; x=1784750923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WB2MJcT25aW4xciwtNpRduuma9Lg4geJEuusUG9ev68=;
        b=qUZNL7TrCI6Ln+WovxRS8aYn5lgE71QT1mbdo9Qp5K9oZVKpJKO6YZGnv1mVf1BkwG
         kpzdB4r8uvu0b4Mn0qWiFAwIQ+COxzif0j7Guvs+hH1qej0eKgSbIx2I3yJ5DzGa2U3m
         O0H+cc89r9YTFOpuAC1k/gF8RUvXbWTAEicFR5gtAKrMU0ndnEqdkwL5e4ZOZdEPou2u
         dcP8aUbknCsdADjfXqoa8N6kRwGMQLAzsxHf2iIO4aDAaNcTtB6z0WzKVVjzgxXIhsYs
         TEjhKUNX5JdiBC55LelefZy+DA7BvZFry/L1yV0Q5fQZPK3QAR9C2bwtraSF6oID1OQ2
         M9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784146123; x=1784750923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WB2MJcT25aW4xciwtNpRduuma9Lg4geJEuusUG9ev68=;
        b=kc73bBN7dJ33OpgmpmPk4hjVs0ECdRXNzvxwn+/3x4UhnA5Cbf0VJnNjD9oDgs5GXx
         KuGZJA0oFxZP0yd1mzlW9Mue52Z1rUwruDomgelXmFbCATJlv/34eEh2pgjSEgbVhWf3
         AzczChShEORbWMdGdHsZwjJ19nQc3xUhNvtNSEkUt38D4VHK9Wq5HSEA/CpzPDLclMiG
         zzKdamf35r30Ym41b63LX2fQmZafQKC+RMemduE+YpGjM/QcjsQ2Mvf2ql6/4/OaZrhT
         +cWWiIQ5Cmo0CNkZRcxHl2T2OTN8spXEpHN3QxrUOly4gwWwFUsdvtDHLqr1Ea6VwV8H
         N3Gg==
X-Forwarded-Encrypted: i=1; AHgh+RpG6LkD6BDlUo3tW+ht0X92xYUE1edhHmIa4dSdlHmUoGq9qGbWm6d7K5GxjPW3y0NxQqhFFvPebpMJRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfyHNLEn50p6FhdC13i+rDuVNVI5s9vBA8SxaCu6T/MkOAzIH+
	vMnT13JGvy5Vp1g0KEP1wgl+YO03cqYjL67NVawSuuGuIQDHBwi7uLPA
X-Gm-Gg: AfdE7cn7Nv2HChU+Kk6/jus0JO6ShUc/bAhBH1BNLii8PUt2ZPh3fgzY1Ciqt3a9D0z
	n0bXHfaYRJQPtObfEHw/mtNEYbSsi5ePHIe8I8yftFsMcVTq6clQsFo53YBvYI+Ta0YCLa4lG9q
	L9Npp3z0v8JffPPKV3zZxb10JoXuxDhgwP4Y3KWiD/MriwmkdtEaYJX5jJZnXJqWPItsCir3+nS
	NPBHo3JEcdvSgf9pEi/ei2DkkkmH+/SIQ6OqZqhHBMXXYR6rt1jWbkV6Jkp3w9pRRg5y9PI2CDh
	I9L30ZzDj/G0/RhWnRE+yYGl7CoS3v/KMK4+j5we/TJX+A5PpETa3T6LWyxCE7QvNVotETAgDUk
	WaOlUA0YtKaJ2EbToROMWNfQTGjjkA4szwTaQULSOzImPoyuS6G023e9g+e066aAj7+KJwKK2k7
	wS61bgzRRPWxD49385k6KfO7UCtZPqM211g0QpKbjZLoyz1EAqyDXb9nyedKIefXlqKrEkTAX36
	DG4aSuuuDP3wEzjdM049w==
X-Received: by 2002:a05:600c:4fd0:b0:493:b246:4a19 with SMTP id 5b1f17b1804b1-493f8855831mr121524865e9.8.1784146122782;
        Wed, 15 Jul 2026 13:08:42 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B883700BD3E109F7898AD30.dsl.pool.telekom.hu. [2001:4c4e:1b88:3700:bd3e:109f:7898:ad30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e7d21fsm7300625e9.2.2026.07.15.13.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 13:08:42 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 0/2] media: synopsys: hdmirx: add HDMI audio capture support
Date: Wed, 15 Jul 2026 22:08:32 +0200
Message-ID: <20260715200834.8486-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds audio capture support to the Synopsys DesignWare HDMI
RX driver, which currently handles video only. The controller extracts
the audio embedded in the incoming HDMI stream and feeds it to an
on-SoC I2S interface; patch 1 documents #sound-dai-cells in the
binding and patch 2 registers the generic hdmi-codec as a child of the
controller, recovers the audio sample rate from ACR N/CTS and the
measured TMDS character rate, and keeps the local audio reference
clock locked to the source with a periodic FIFO-level worker.

v2 addresses all review feedback on the RFC: Sebastian Reichel's
binding comments (hardware-focused description, documented DAI
indexes, consumer reference in the example) and the S/PDIF DAI
handling, Dmitry Osipenko's platform-device registration comment, the
Sashiko AI review findings on the driver's error and teardown paths,
and the Media CI sparse warnings. Per-patch changelogs are below each
patch.

Re-validated on an Orange Pi 5 Plus (RK3588, i2s7_8ch as the capture
DAI): stable capture at 44.1 kHz and 48 kHz, sample rate switching,
repeated capture start/stop cycles, and abrupt client termination
without worker leaks.

Igor Paunovic (2):
  dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
  media: synopsys: hdmirx: add HDMI audio capture support

 .../bindings/media/snps,dw-hdmi-rx.yaml       |   9 +
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 280 ++++++++++++++++++
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |   8 +
 3 files changed, 297 insertions(+)

-- 
2.53.0

