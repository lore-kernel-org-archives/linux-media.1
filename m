Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97DD435EC0
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 10:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381570; cv=none; b=e3N/gBAEr9AYr71PSVQw2x1F13d4ZQKY06W1KJTBh1X1casQ8xgok8pfHknHI2IwTOAyNkXTup8X2oKSbe+SS5+TuUk5ureE+S1OpMLCIYihSz3ZlORRnvJfkUZ8vZkds35XTEfdHFvcZnNWV2GgFgSdKijqUQr8LyOabMTOFaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381570; c=relaxed/simple;
	bh=JTnC7evvvSVnCXtJTc4smePwvrp7zkcqWy6xw6xapD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jwV1/V8gUsk+P9y6UEejrkZ71sp2PVAnOIUS9MMpFTKTfAJwiJ16Oe5oe2k1urr0c3zeYGzOORoLNA3hVYVw3uugd7MhTNPFqiVQyjdRRroK+LTmRXFdNN6W6mY5cLR7wCTZJ9pLtzAHExkIwmEJKhrH9Dr6HWOibSKKgiSh40Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nwVcHXtZ; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nwVcHXtZ"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so3469157a12.3
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 03:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789381567; x=1789986367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/xjkeNfa3orUpMBTgLWbWZfnOZ+F/SCd2qFtqtxeTs=;
        b=nwVcHXtZxtDXe72sBxVwCcyzRywU2DyQ02ZKTKJBNK8e0Q3gIALRZc+DD+Gi7JhuHE
         U5zX1vTTiTwdEaCUPf0KKf3oiftrr8mqL//DZ0Bzu8E9Us46TcXbkxvWuJgRjxfh7hNL
         dB7H5cvtOPxE6QM4o+KCA+vxw5w/P5todRRLH1b7zQQr9JJSvJ3tI41Q0V8RMpKzG5w6
         5+W8qXcew1XZq+0WhwhfUIwIN/7RHTSGstQTeuWFW/RUr8hMG7v7bApdBfQ3QmKPPLts
         aNG+7BltkEkkN9Pzmg1S/2NnT8IxWp3q03hg88rjcx+lL+2+DjrUoZmBTid54WTFkAA9
         P4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789381567; x=1789986367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/xjkeNfa3orUpMBTgLWbWZfnOZ+F/SCd2qFtqtxeTs=;
        b=KNrRxnwZLiBSSYuiSZub5z+uLm0va59W6GzY4oq/MOT7zbANYmyjk99CRs88qVAa+2
         Hy2nWQAre7/4FboI+76+JQM3JI7Ckd5Mm69Wd10Hf2G7sH3hfIlhjewfvwZItC2ef3aC
         LjELGpKYyRoGTOnbs/FxLtrJ6ye/Q9Sil7rY+RdSA5uxUQnczbyEU7vi2zhAi7DyvBLK
         FhiraYMre1/JkS3JvWcPLMqgeA9soXVTKGf0oW++C0AmtREr9hketJx1I10j/KB7+hKp
         /sRVp7FlB1Dmw3oqfc65X9qFwJrwUR0F/hrhz0/KeqJubW5zbS5iUXijURfdWNnzIxCi
         BPvg==
X-Gm-Message-State: AFuF++ml1Wg66jVcpdeeQ4HnBSwE03n39aSRYq60tEUZSP2Yk7AhnFUM
	Dchc8Q9hAnI0NB8qt+fsmoOatO+9/zh8Rqoiqb6Ze9aCKmDXLfWjIwMJ/oXWzJLLhOU=
X-Gm-Gg: AYBFou0zH7AU3RztbQDDzZYWEuUF5Z4AntPkOcOMAJI1iAkcLcpp5eKbuF6UCvIhk6Z
	cRQdHYjMw0i3KNzRmrsRUbm14XwYaH4HbpB7l2qwmRggAWUiTh7D0I+Onp3IHDArQlY3CuU5X6D
	XRLaCdByzhZ1pSfNJi0lGpclxuorI7RveY2pFAB1Fb+0YLIViYcY5hQxjQldGhMlNl1pQoLd8Yc
	ztYI3Ou34QZ657TzdSmGFdoayDF+YUw3txjX0MtQH6xlf+TIO9w3ZasxUaZf4zpnv7pggmOZlp6
	pe/jR+yOZR3cvazJBfz+lbS0BeBbSjafjtTPQG3Vjw3csNIBxPVR7h62u0VRjVgnMHWPCBYZENI
	/Z21ZD1BgcdE8S3y5FGHLdrTn1gVdqZwX5vOhP/VeFDLmKUE0Mp7L75Y1tbIMZ2RLMw3C2Kgc8M
	or6+Fdz/ora+zSrqM6abRWgBwtdGElIaOG6NCfJHppAdIyyO/QYD2cmDck2y9QZEjCh5DATCi6t
	pT9MRQkgKHkruixzBUxb//xNXHn6CFgIFIGxTUSfNYQZ74NO7WA+kiZGv+f6YMNPYTceA==
X-Received: by 2002:a17:907:9409:b0:c26:1648:a067 with SMTP id a640c23a62f3a-c29b874c69amr127928166b.34.1789381566684;
        Mon, 14 Sep 2026 03:26:06 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660654f2sm399985666b.28.2026.09.14.03.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:26:06 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 14 Sep 2026 12:25:58 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-dw9800k_cleanup-v2-3-6553273aaa33@fairphone.com>
References: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
In-Reply-To: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789381558; l=1259;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=JTnC7evvvSVnCXtJTc4smePwvrp7zkcqWy6xw6xapD4=;
 b=UixvnkrGXEGNRyEsuLdRQS6wYyb87osS85TdzSWmu33H/b68rRJUlvsvPGSO1HZz69yXJVTS7
 e+qKPeMpv1EAVkjnn2ilPzp7CTjdrwic7uMxC3wLjPSWlV20kFyB3MA
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Update the node for the DW9800K for correctness.

Now we correctly select SAC3 mode and enable timing-control with the newly
updated device tree bindings.

This is a breaking change for a part that was previously functioning,
but only due to manual register writes in the driver. Now that we have
the correct documentation we are able to update everything to ensure
functionality with other devices using this part.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index fa4566df0a711fa0a08cc71fef3b7a4e1a0d2a4b..cc99590afe3a62a2aee3410844ca0815c8f43558 100644
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
2.43.0

