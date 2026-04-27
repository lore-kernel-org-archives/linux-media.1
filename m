Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727A93EF0A8
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 17:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312751; cv=none; b=Dbo1NPNdl3ThM0+b5KC7hq69sFdiIt3wFBzOES6VQ3qohKpZwWwufRYYs8XPxvPsEP1p7kNKdVifB/YJXWl++QLBWe4QplOD997PSST78p0d45lMv++qFYw1c7WN9DC/A4jVCt3qXXP9d4eMYraKpqjJhh+wgKFBijT2SdWedW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312751; c=relaxed/simple;
	bh=VSLaSITH1xdATqlS484rLYMQm4ukxtGBmOVJ8SIHjDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vo97Va7WsM88Kw8ykmf8RYp5ris5Usocq24UmBmqgOpqnaPdO8r8Ltwzyv+cVAYYO+eBJ5ksYNu60e2gJM5mQoJFgRvA1+HlTXIaq7Rz9pN2nAxZ2gJCAFOTb8Lmp0YC7Re9XBq9Svj9COWy6OTZOxe91y4XmRPD6wzBssi1YJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qt6HU2fO; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qt6HU2fO"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79885f4a8ffso111653297b3.3
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 10:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312748; x=1777917548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=qt6HU2fO4BSejfKqc7MrrF2btpnASyPH3dFrPBoiAGyTf2aBSnbxq4Y5wTM8CVjm+d
         EVtkZcjKO/06ouh800N9yL2OaelBT3WrKm7HqXHAHc6bGPWBggnZ+3KFWcl05U3NQgyO
         OlKZNCarsoO0xScwFfYbscejNqVF99k4XfhQd7dBfDy8DdFIy/OfOaK95LvjbCzB6wZ0
         wEywl63Rkx/W2PXHL+6uYVnWHoP4S4kygjLMDh5mJvkpzqaOEKVVQM20xiqt76pfGboC
         r/55WaqZIiN/69AwFIjMeNHr5oLqQ6coNWblFMh9UO1lMgezZ6QwqBT8GH5sDHmfKnWs
         OtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312748; x=1777917548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=MNyZYC+pFsKTZmpBJFvE6ceX/38rWQ3Ym3jHJaZzwnK02LF2u8+aWKEuFsM27wE/KX
         neSV7HyVBc34lvo+sCqhSpHf4ODuOy3nwOeIKL6G2WSJXTCd/NzBacc6g/01PllYLkkl
         XNs9hXozuPraP9znWR8GT4VPxz6YifnYuIqyXAKdEEAphlrwP2bllB2vxE5yrayMKuJs
         Egd9VPIe+iocf56nNWF3nrgIdYA0DqREOVgBKQUfYaIMuDFz/plaJRs4zDXv3VtjMSeJ
         ZGS9gz8tvfc8VS54F+62q3GiKOzNu/0YDAU3TRLA9KCBWPBIO0HuMAJpkcY1hWc6qy3M
         rF1A==
X-Gm-Message-State: AOJu0Yyjo8T4eQlrISuwbNoa7oMaNQJeZLzZYlZfSS8ySPG9qGZpOZPT
	T2tw3N4dUUz9oEyzVIKXA/O3pXoUV+O64tzJQmAi3MA/L4Wd5tM1Ru3t
X-Gm-Gg: AeBDietdROkf3ydtL+KDBtkG/a4mxB/gqitwSd2DknHilbfNM4ubj0XOUKumJU5DMsX
	nfqLLztxReZsUmcULAqGo23xOJ1DEitPeAmK5NJtDQOt52U2CNYBmuN5g5/qYPZysSJ7N4VhYPk
	dqOUJAQza4gL3yU53oiPRqIJCU4TK6SMDJuepUaBUyzJAc9gCuNWXIfCxvCNPoh/fiTHU5P3Jxm
	/+VLV2TzsVaJ7YzuTgOQHPhjStJRR8I9kGijT1JMUw4wLDDsuLxBZ8B1CH40MWSfJY3uzV66mng
	GpPesATbbPtSPf/OrVB5IWLnF1o+vdWKIc94buM61uOE8g9euqMGDRZOQzpyxQpWbPeTPQRmRsS
	AdGLzlgyv9iAy+HnKlylUQSv3R9VjhJwQEUO6n4VhxXXNpnsqK4XUstJsFUKGwhbcN8ohG3WYN2
	QW0TzTaVlRn+WR6NFW93R8P7l7KHS7k4LMj1Ne
X-Received: by 2002:a05:690c:12:b0:7b2:aabd:535b with SMTP id 00721157ae682-7bcedcaff28mr3033417b3.27.1777312748556;
        Mon, 27 Apr 2026 10:59:08 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:08 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:28 +0300
Subject: [PATCH RFC v3 06/11] arm64: dts: qcom: msm8939-asus-z00t: add
 Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-6-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

