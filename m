Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9FA45348A
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 20:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146127; cv=none; b=IKmIR0PB8fWk40XtlNMsCTxLAUniEdKj/N1l1a+t71zVKMhlXd4OqyX2X4c0H81xI1L7MKcBXSa8r199woFPj36ITHPUSbSuGcOfapXznSw8A8T0z+q2zMz+zWB/oDCy/kfGlpgfGgyCtxjEqEWKKFqXlhxwTLToK/XVjhluCr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146127; c=relaxed/simple;
	bh=KwQj9x5r3NnAS6rPT6Eibwqo0+6sNB6Iy2t/kLJRx6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+tTme0H9Iy1FXFGHZBqj/R6ZPnoHD9UO+3cS/TWCZzJgJphtkq6KO/SjXZw8PUVI6gP1bmi/wyEfo9UcfVDs6Ypf89V1cpVsJkB8R0yWXHHgla7l0X/zOHaA/OKWqffyN1OIBSh/t85jsnD08AtYUbebv1jCq8XyV9Vz8n4jf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTNiSeOm; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTNiSeOm"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-473987fc217so638165f8f.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 13:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784146124; x=1784750924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeHrp0h0eAivuWcQqu5FhRrR91IkX6jHoedjZOFxbvo=;
        b=mTNiSeOmb0RKTHeh+tQZlqjoC5nMMtoTWJvop3wRgID+KfS+RTZ7DJSFgVSuNoYq7Y
         xcyhn4JXelATh7Rk4u/tnaNm7A1B7/bQCnsFgJAw+rWa9FIemJPxQxJvH2V2Vw38fIvl
         a1yISw62kYRYQ/jzd+e0NeRUa0Nt4lkDMQzeBa6fmXPDvk8FF7gIeah+m4Fl0o9Lkger
         l0kPmjCgyhXb4vkejHDTP1VtT2JoZYnqKUrAhXENJGFrnnn06hFo2B937+fyrkM/adgH
         dczcDX5DvIYp3tq6kj4dRVnISXEsCMxPksRH/vF3YZP/9muZfkh1SKd4L8A9Et+8TvUm
         EeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784146124; x=1784750924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jeHrp0h0eAivuWcQqu5FhRrR91IkX6jHoedjZOFxbvo=;
        b=h2gJPxFEONLzcS9uweN0v+z7yeYlSi2qSoUhm99ne/rJiVhqB7JTyjd+hKw/kzk51D
         B93S/Y70ym+B+yIgMWUemlne4+MHQ+anqBjn6QIQ5MAehcZSZhulf9mrEezeaB3wEEtH
         VGXWFhwAkauRHMCXj5nXIFimWgL5+y9OclCyqyAhXyNP4MtdMCf2ij0giWSG+Rs5xN6o
         O6LO5yJbmj+J05gcwT1WhTFqBpyGit09oNNsABz1Zu2IEurBaXb64hvOybqklA3sMxU9
         WLc/ZEc7CMcvsGD3/oE72JySwShaidJzPE+79tDaTSFLLSMW+yoE0lhm/sJVJur1/3mk
         eRgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRgfUh4xJA5xs5T9OHlkUqSOK7Z8OdvbBT31AIETOsQrYyLY0YKsS25TQMpGOYRttimrpgWv1pOWdk7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8IFt+UtPuYxPR8IvxRgvCRFOpfrgcTUiTyfgQyi3FnnY+ry9+
	8w+hVJkSoP+g7dVx42MThcp4OCIbY7Ax57v5MqJH2hdCD8LgvcVo+LiO
X-Gm-Gg: AfdE7cltZR8aXbGKkeNXPtQdyz4mSij8iYr6KB6EvUEbvLChBKqG1oQ7hOpCyAiZ7Ru
	1Y2V1/EBQ9AJm1e7YWJHevTunyiyGnyjKj6hK4cZLMafy/rr74b4qpleoxRqAM20Cq7F58CkaYk
	ODcKAdWq+zArEnQ/Ev1p2VyePlQe5ycB+yAIltX6gZgKYSfuUjfhp9Ph/qJslmSVogYZFSoeo24
	W4BxCAil+Vvpf9BmWEfj2G0dufMHP+jhrasJ0JG3atEl+jO5mAe1OP3BtID8aiLtVoqoPDCLg3S
	reciiArLrddA7gTABzlFK8SAKo+WTuHRzpnJr6ihsSPZmagV6LlVwKK3IJb3S1JltwXFLq1vlfc
	eiAqeXjs/dx8F+4mmN+MiHsHvsE9kdvM6KYbIFbeml5RCiypSufyt90IhyE5FQlw2BHkowTRdfw
	NoMVAcwUTYaODlWCtwxaERiDYKgNL9/E6MqDXeklr5m07mWd3NlcntTFpCQ+imMviZzTyIywzVo
	dGN33OfuOlclM93zW1L+w==
X-Received: by 2002:a05:600c:1f8c:b0:492:7082:92e9 with SMTP id 5b1f17b1804b1-493f877f6b2mr114390535e9.0.1784146123961;
        Wed, 15 Jul 2026 13:08:43 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B883700BD3E109F7898AD30.dsl.pool.telekom.hu. [2001:4c4e:1b88:3700:bd3e:109f:7898:ad30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e7d21fsm7300625e9.2.2026.07.15.13.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 13:08:43 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
Date: Wed, 15 Jul 2026 22:08:33 +0200
Message-ID: <20260715200834.8486-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715200834.8486-1-royalnet026@gmail.com>
References: <20260715200834.8486-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI RX controller has two digital audio interfaces, one for
I2S and one for S/PDIF. Allow referencing connections from audio
codecs to these interfaces by documenting the missing #sound-dai-cells
property.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Changes in v2 (all suggested by Sebastian Reichel):
- reworded the commit message to describe the hardware
- property description now documents the DAI indexes (0 = I2S,
  1 = S/PDIF)
- moved the consumer reference into the binding example

 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
index b7f6c87..fa6cd0d 100644
--- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -78,6 +78,13 @@ properties:
       The phandle of the syscon node for the Video Output GRF register
       to enable EDID transfer through SDAIN and SCLIN.
 
+  "#sound-dai-cells":
+    const: 1
+    description:
+      The HDMI RX controller has two digital audio interfaces, one for
+      I2S and one for S/PDIF. The DAI cell selects the interface, 0 for
+      I2S and 1 for S/PDIF.
+
 required:
   - compatible
   - reg
@@ -129,4 +136,6 @@ examples:
       pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_5v_detection>;
       pinctrl-names = "default";
       hpd-gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
+      /* referenced by a sound card as <&hdmi_receiver 0> (0: I2S, 1: S/PDIF) */
+      #sound-dai-cells = <1>;
     };
-- 
2.53.0

