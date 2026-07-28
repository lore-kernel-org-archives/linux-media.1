Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF212F7F12
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 02:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206969; cv=none; b=J0J+HRuFtMmrs9FIgkAD2s5BF4BWUcELorib3CdmEg2/lNt3tuxno4CeJdDh/yDWOgDL0EXQe2jjgAIyHrKwDjTAhbs/gZ/iQ0siMtN7nRp1HuLqz73ez2l6kXybX4Dsqq/o/CHAQjSxXX5MYMk3HV3gmnQckADTY80XFNdOLyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206969; c=relaxed/simple;
	bh=eMDL6R7A88J0Kxgo7GwZVeOD6SjDV3c9R/PY3h9YVK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3GZHF6cgEAtYUpkfNg2VcCz71rNIrXt0akkioH1jAB4j1kO/ZYVzLyUTDwGUth8Zvql5mtkb2mxu7WXs9sHdwCtP5oT76SXicmKTsq6oYK6MdpYsH7DrgNnwn0Y4mUshNeGfBmBmxpSSXjV0UKH2WxQbZQ5QFhrgqdlOFasQ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dht1nh15; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dht1nh15"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81e6f0b4610so35300927b3.2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 19:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206966; x=1785811766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMrIwKP808Rw4T3v4dtu26EGLZbL2Ysq//n5nDtGcIw=;
        b=dht1nh15zkFWW4V2Fsg4CfYh/sufn/Yb04cAQcQkTVAwkvIz5prQs8UXRGQwOZxTn7
         uf54SALe9QtCXJnXN5h6DzFWWCgtw6nyaVJOEf2aZGjEMSa3w5T50kwmRjnmSUxWuNcw
         w9z79K11zgbTMuOBeRHUp5L3wL6jK/Pv+Lll2F91dt0iwsnlYxCQwAzG6Wt2XnMUYje6
         4ePa5YlZEVOpQI0SsYjKIg8XqasTVre95zRnBlxC/5Bf5akagCEoPHjsDjstT7pJG4P/
         qcQOzvg5oROlvrUH1m9UQluN3QjYjLq/mkREMG7ad/2XEkYJUC/675haDdq4V5iyCL3f
         +aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206966; x=1785811766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oMrIwKP808Rw4T3v4dtu26EGLZbL2Ysq//n5nDtGcIw=;
        b=Etu0OH+7rIvyaQG7lIi//XQXgwbqhpHIdJeqV5BW+G+aSy2TMbPsLKlb24Jf/Q5Dwp
         pjzmZkaqpnaAqZ0DNuli/sOyvq/VVyvFBjVKRp3kHTEk/I2yO69UTHKa5G6uKQ4igUpE
         Qa8bvcTedvngGg6X8FDGgoQ6vIqq2fH0CWrENPgW0sQZHCIli5zUwqfsk8uQJfxpwbbB
         hSZ7vsSAaGsIk30rT6k1n/SBOCmR8aaO2lty/7Q55HDp1Ib6Hurfz4pBg1WWGtXwhlWs
         y1ufC2Pvl/VPfOqK3aUHSCkkjOmpAP/J8El4tiRYC1yfchlBYPRO+ccGB8V6C+yc//qV
         4ChQ==
X-Gm-Message-State: AOJu0Yxl0XpY4t9e7SGkzkzg4qe9+YRO33/ZAlui/Q6Xl+42nQOr/i+2
	6FetoN6sXP+XiAlM5VaxCcm3HujH8sIB6USJrWX01JMD6NzGM7ygx6Bd
X-Gm-Gg: AR+sD139CIsD67nZaCI8YyWL7dqTr6euPaYfDVifqloCHN9dxM/HQIBgBBcGREwfXyS
	lC43iagv/3OcngnhWKfIe9o0yXRe/u8ap0MalNiMT6Fz8yu/gfs8KhxpmpT759cz5wdVxcRwvjD
	PrmMLLLj7EPJss88W08BZQ9Y/dNqCBX5iE5gsuv/c7x8SxPiY3b1rtIWLWZb2YTeXMAbGwwrWsc
	26Mry+VLv+QdjZGXWgE+liix1ragYNkSp5Smgr/Ofmu1itKkhIkYsR+6tMabOiYTmwCasu4dEhA
	YJRn/Nn7romEQudApmIEJNuceRi1iIaR44tBpjMj64ivmdEZ5Z/7+q72J9Is3WBbqxxvQbDC4IY
	WtKLG0m0d2Q/qtrqrLVkBuBWx0SBQRsV4eDYfYkPKeoG/YQUCXTqziVFpAUQtOaBrAWhOdzBpuS
	lISwR5Ywj7rqRHd6zKur3p74gLGA7sFUrlZxrI
X-Received: by 2002:a05:690c:9b0c:b0:81e:695b:585c with SMTP id 00721157ae682-81f990e2287mr1923257b3.4.1785206966382;
        Mon, 27 Jul 2026 19:49:26 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:25 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v4 4/4] arm64: dts: allwinner: a523: enable IR on the Avaota A1
Date: Mon, 27 Jul 2026 22:49:16 -0400
Message-ID: <20260728024916.993224-5-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andre Przywara <andre.przywara@arm.com>

The Avaota A1 board has an IR receiver chip on the PCB (next to the
Ethernet jacks), wired to the PI8 pin on the SoC.

Enable the CIR receiver in the main power domain.

Tested on the board with evtest and some random TV remote control.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
[justin: move the PI8 pinmux node into the dtsi patch]
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---

Notes:

v4:
    - move the PI8 pinmux node into the dtsi patch (Chen-Yu)
    - add my Signed-off-by (Chen-Yu, Andre)

 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 474354fbfcec..994f1e4f0ce7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -100,6 +100,12 @@ &gpu {
 	status = "okay";
 };
 
+&ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ir_rx_pin>;
+	status = "okay";
+};
+
 &ledc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ledc_ph_pin>;
-- 
2.54.0

