Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBABC4AB1A3
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052065; cv=none; b=mK/3rLlg/yXEHXGjCE5jIw82L44wlxv0H/0rrv7CAaCFlhvqEmxsNH7DaTXQRzXbxHZU93gu1ImFFHLXZQWhc92V5Q9qOdt/TAYZsv5YCgZXsenzz1UcsUBC3vY7c3NexjjVI/uE0CuAvCfh0f7F9V/xv9R6ZwD/vVBt3NAN0qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052065; c=relaxed/simple;
	bh=MquNAT6A9LY0z5XBr75rwe1nLNnGi+rAfX3A8ukDpvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHXDL67LzfpV3A9iVf00nBknnWGCCzDw3zniMnXe8lK8Pg4WguPXyYDUCVNYmVGa0oyqmDF80oP9zAsgiAVD7yScpbs87rQ+qSMUIV8DEM6Sc7sGv2kCiP3wGIwUwU/46fzvqsfkP3u29iED9EBIB7Kqqifz1GTvfDedJjUUft0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1DI1G3Qw; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1DI1G3Qw"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so11119736a12.2
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 07:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789052061; x=1789656861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4Lui4dl5qTw7CI3Pdg3YTOJV27r2TrFCzHImNPail0=;
        b=1DI1G3QwZ5PdR1IHjQP33Z1KgiQXN7OvvSBR9O1MqZhykb1LmG/yqxZaL1ZyEJ9zZH
         PDaFwJvVFFhfiUadwo3LddVdlvKgk+MsMkcZDZbdKZk2S+RQDqMO3bxxfcW+qmaa6wis
         4LAy9Jw6H2xwsUK6xtQbQlwEFurAkEVkGUTpCUsmMmjhwN2mI9kNgyYlrl9a5p/L9Bc6
         67OuNk6g6oNsRFtoY2AV0xOTtPCd5IHbjL9JO0xg7zYYJ1AM8guHnXlJxFdPhnGcKBV0
         t2+uNE/IgnIxBodBIreYA+P5EaEdI5cA9RK5pF6g8Eqz4C3JUXUpC5eUDH4Ojw2M93X/
         5Ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052061; x=1789656861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4Lui4dl5qTw7CI3Pdg3YTOJV27r2TrFCzHImNPail0=;
        b=rvw895kHfbD/h/Q6s4LXUlcPOyZUBua0BKdg56BGYjPeVtkCBlldRRPlxZcwhDVZL7
         CQ1TmcmTZ4uJGzoWg6LIWow7nzkIX2AWrlZIdWUvAA1ndXMIhcaEmJYFJ5wVfyLO83To
         dxkkmdfxAF8ds0dPWwHtJe5+IOF152KicKrVkrAQ6hhxzUeFILokmRo7iX1sh5/wFybD
         Ho0FJ0nxHZbr8ieaX3lLF+jVjNYqeIMG90Wo7YBYl4H+iL8TQRbbyNvs0ku+EZTuS1Jp
         /nZw1syEvBB9DcTrWiDqMqvcUSBVsEpFyaN8mG73Ex+8i+IfN6h0CG5ejw2gBKkizdkA
         j0rw==
X-Gm-Message-State: AFuF++nbhYhfQi1rCwp035DLHR80mMLYP49jAVQG7llDCWFzJeE7aEhV
	l1aNyq5dnuRKyqz7eLS7zEFXoMHOJ1vgJ6jWkaro1u03/HHhS2mIEjeCMvQ3jMN8Tq4=
X-Gm-Gg: AYBFou1NaV8R9iNR3sP90VWitpWmIxbLXSHhxn7RSnP8UxYQILFzpOm+cGvzlgzuymh
	SKUBUZriTIlV7T/vhUyWHvzUIugBn3eS/spEGt8jORMTH5IL5xfs8SDlF9xGYj5j8y6TM7Lghc3
	at8LxYOGArahsTH53PTtSE9YUmy5O3gekmo39Gpqt1xWi24+Hh4uUIljOubhaCueXOmOreU3S9v
	Dw49iitk/Sl3OKeMIGVDd5Kn37VQGoqRC1blvHpO87YYCtu7zjXyLCnht4d4qST+VS/plqQsm1i
	jIegXjx6t04uVa7ZcLh/dEgZuEq20KqXLR6D2KU2SSSgj3Xb8Bt0BO08iAccMAcKtBNVsuWgBQW
	YdPKRbM7bBtnbEcjV8c6kHQD794qGvb0Rf8ap/EkuW/O4jLA4ZiQCgaUb+4g6DCxD21Q/WRkz8c
	bxC4SR3Bd614h4sLCpszE1S06z9ZTQRLn/AOs2X4W1rpRzGtcbJfjwa2gKpCYZUHIJW7JqB42EM
	Urtue9ZqbfSMTFeEFFELmBvWE95J7SwEGV0rKKzbF4wyKDxkxs4DMFmMssWA+RbTWw=
X-Received: by 2002:a05:6402:5003:b0:6a9:8ea3:6507 with SMTP id 4fb4d7f45d1cf-6a98ea36c7fmr4599746a12.30.1789052060890;
        Thu, 10 Sep 2026 07:54:20 -0700 (PDT)
Received: from [172.16.240.55] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20c0fsm8849715a12.30.2026.09.10.07.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:54:20 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 10 Sep 2026 16:54:18 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix DW9800K
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-dw9800k_cleanup-v1-3-608255ea61ab@fairphone.com>
References: <20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com>
In-Reply-To: <20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789052058; l=947;
 i=griffin.kroah@fairphone.com; s=20260910; h=from:subject:message-id;
 bh=MquNAT6A9LY0z5XBr75rwe1nLNnGi+rAfX3A8ukDpvA=;
 b=se1xMaa6rpRe1osYihYePmbAFEtpW0H4VSfKVR3ef9ziNFAgHHQJNLCgy4nJ5LuVD9CnbTt03
 ezkt/cxqzV+BRQNpBmHoWcwYfF0WKNTEHjOgG67NGDWr7f2ora7BkVq
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

Update the node for the DW9800K to have the correct attributes.

Now we correctly select SAC3 mode and other attributes with the newly
updated device tree bindings.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index fa4566df0a71..cc99590afe3a 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -744,8 +744,9 @@ camera_imx858_dw9800k: actuator@e {
 		reg = <0x0e>;
 		vdd-supply = <&vreg_afvdd_2p8>;
 
-		dongwoon,sac-mode = <1>;
-		dongwoon,vcm-prescale = <16>;
+		dongwoon,sac-mode = <3>;
+		dongwoon,clock-presc = <0>;
+		dongwoon,timing-control = <16>;
 	};
 
 	camera@29 {

-- 
2.55.0

