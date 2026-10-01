Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E139E534472
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867900; cv=none; b=brvz4koCB6f3MVDzcKXb5sghPKDUDn6bDZbIPXR0AuxmelhpiFSfhECCmEIHZ7eyDUiEqQujFArd1ru4MHxQJglFKBxjtV5NBWMBWmJE0D5RwKuPUCyyODsIG43Ce2achdU4pDrQz+4gKVjfE7n8ujVZm+88V+jUBWl7myhs9DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867900; c=relaxed/simple;
	bh=5KV0AqXX2OEMwqqrKW1yCmYhVV+tDtyhJFj2NfkqB2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bn5j+Q7yNxzZOW2EapOI3/D+PIL/8FyVLU1FADnYqs5FXT0UFBJhAmYNnCPuyVRDLHWoAQX4E9fQA8OAG8h7FAKJLcEVawCheCRiUGzEa2urHBAyWdfmi3IZape3+6wIb2U67PRLcqVXAXtY5+F+/1xXNG7j2OXhL8M8ugqRe4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKY/NbOd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/sMhD8+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKY/NbOd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/sMhD8+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DwsUe2008510
	for <linux-media@vger.kernel.org>; Thu, 1 Oct 2026 15:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8jwmXUc8FQUFOKj0/6yhNhLY1kS74hceGiUFkR3ZhY=; b=XKY/NbOdlUui9Ojp
	qDH3nBxycXpLVRkUUYre34LEk1ujVox1wkIw5Qhqfe9DgKEQzidXbL6CCr+4s7Ti
	G6rVsZCDUgG7O8WzxHjPUpSEkqIf1cqBT6HPCOS19glQUewdAJCEiBMB5SDEfION
	K/kGvsXoW17RPlt2+dhwAwbEqPSNwb0JeILJceYCaHzWXU4oLUH0mzSjr0vFP4L/
	7zRuo4w2uia29meqOsaUIOK/cGIm5gaphMM5eQGJQtk+OUppA9Qahaz2E2vEeH2j
	tOuFkNIQFnNC8jbHSNMNfxMZOZOYG8VOwuQLekouvbAv1V16YAvWgu+K35KQeZ05
	qlQpDQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvq8d7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 15:18:18 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1466ab2bc8dso8837988c88.0
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867897; x=1791472697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8jwmXUc8FQUFOKj0/6yhNhLY1kS74hceGiUFkR3ZhY=;
        b=S/sMhD8+0m025H8h2FMM6cDH2Eut53eTT82jsqgP4si02g/sfZ4NB1hM2o+QBpIoW+
         R0XtHI14y+g8ziI6uvCQRVpH0dP5RuF7QTtMv5PuPj0TYvx0LHpWMQg+VCgO+d3tNU8+
         s8L+q0VziZSbzYnhMNY2sn1oIEwpe667lS70IY2qpJbSkRnNOUFkxnuNq9nLW4SPAKYl
         TyqMQJxM3zXunOMQYXy00fRw5ud0kqIYkjf56oNxUsOWJwpgyfn44D/zpTlI1iqEm01t
         DVAiALE/33I2Fv2VFeXaTESVHLVLUK01DxndcRBtPYzEIO3TMRGibHNAnXT44oNQpuy5
         WjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867897; x=1791472697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8jwmXUc8FQUFOKj0/6yhNhLY1kS74hceGiUFkR3ZhY=;
        b=MYkTh/FDhYPNVUn0vwj2GuxE3lsLPOHe34B390vwQOhSkZwpbxNyHzlfIxCgXebYow
         EB5zcBxBdx12KwDn83cessxpGT7vX0B5SQs+weUyA+G8AAxSz57oUYsXAo7aPRfmpugF
         kyfeand2S4zUIKcsBu0ReXs30v/QIwZ4EOU+q7VT+LI7unbOuKh6xiG65Gjfw+h4PU2Z
         YQ/pI75zfZCZLAiOrotNC65u2UuQUkaDSzaJDt3UbOYl3aI4+4QeGAZC2Fm9wKAnhwjb
         umCLbaNqVpHVi53cNupJkIKM4C47DLEGJ7ZNQVMaDUseH81BUN6OZHMY1GA8CjVxJqoH
         FpBg==
X-Gm-Message-State: AFuF++lcGQHSYl622nXpI7dnr6NjfIcQkp8gaDNys5Qc9vYCqJSzzF0Y
	BicUJrHWgNchOObftieMj+4za7229nYRUq2IkCK8a5t6RmNaO3klp+b52ksxId9n+Ycy+nE2mEh
	XaFTgJAgArAfiO+7zucGHUbICCGataTpchdNq5FRDHFkpMN5emlhg/+LyN7oQZnm3SRpaPD5cfA
	==
X-Gm-Gg: AYBFou1CzP9Tc+VhDSd4hIkZiQENydh+Nn1nRCniTcCyObxi6gm9xwUy1ovHUeFKuk6
	PtEldHaNwTKEQBGDSqAtFnHUUavyBWVJyjDNyLt22YYHP3Ks7mTMaZPmzEU7AO8jyIQ9mOHsdap
	u/ieRxr216JM3SsYCx2YNN3sEGuZYx4VvqYNMEcLmiMTKD63cpJCTutKc1n7pOAs3cjHd+ty1XV
	MVBbEJTRykMHZQtC6Bn3gw1RltR8APBtWrAb8/ltBz6L9RsUWPqhZTc430XK2JGSs7xraWP9t2D
	EEkOF0pixrqtneuMuht9qPd+5/fKMBaev4wK8+oIgkrGoeYIXL3WKwlQR5S7Y1yg6yuZFMzUyfO
	gZrP5BX+xDsipUGwkf/dotfXoUjKG7wdZSg==
X-Received: by 2002:a05:7022:ed02:b0:145:7a:7765 with SMTP id a92af1059eb24-14d331a6544mr4080627c88.36.1790867897168;
        Thu, 01 Oct 2026 08:18:17 -0700 (PDT)
X-Received: by 2002:a05:7022:ed02:b0:145:7a:7765 with SMTP id a92af1059eb24-14d331a6544mr4080593c88.36.1790867896233;
        Thu, 01 Oct 2026 08:18:16 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f246d32d2sm115700c88.1.2026.10.01.08.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:18:15 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:47:26 +0530
Subject: [PATCH v4 6/6] arm64: dts: qcom: kaanapali-mtp: enable iris video
 node on mtp board
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-kaanapali-iris-v4-6-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790867851; l=963;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=5KV0AqXX2OEMwqqrKW1yCmYhVV+tDtyhJFj2NfkqB2Y=;
 b=1UY6xzT4aqvUmIBKJTk9yU2ObYQd4Uln0H0wq77IC++vzIUv58JOCkE/GMEFVgPM9tDWAqicp
 oza9/QuBBgYCp/e4rVQ605tNEgEATtK+FAungfosjQPyjxdI4X28TaI
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX0ivtcZ5HgOHg
 hUXPrM22sUnoyWtCsXDE7io65oYGZWq4v8zkHTYPTEdekS17cMDkaH1HcuVxuDQn5DvpwkNJ1RM
 EO74t+K3HtMsvTmkfkWlw/z2IVSSGcrsSYO+l5IsHzqWFLOIPQd/gWM8kck7LZnfMS0c4XNmj5S
 B0eR+CrOIeZCqv8Qi2q+naTpjBEUCFB6hSyzTbk7gGJOKCx66wifyEcMBjrZY6FgHCQflzTSKq1
 UHX/vZZNx/QiT3lwdlg5yS+dNe4gNi6dMdVl9xg8mSN954QBQW+o/z805ZzlsjWeJtzOXBcP284
 btdh+eGeC9ifl/UmrMta3c8H3ocvAApEs4uvY3pPJKdz3AneErVQ3SvySR2acN8U5sjtVVMr2BF
 kWgMrZZgzOoHhFaxHuAYgZvtwY7V0VuUUGXa8RiWccrCvCfmz2AABl9SuPcNhnzFkTPV6XZzE+A
 S6nwPDT5IaoijMDzu8w==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abe79ba cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RDbdyBABLrhsN5S-fyAA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: Z7e9YlAvUnDvO1OLtlWLJ2tuk0zkdNe3
X-Proofpoint-ORIG-GUID: Z7e9YlAvUnDvO1OLtlWLJ2tuk0zkdNe3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX2Fpd4+3evtZD
 CwKxfTeSicY+CzCaWwK+vbHlg4Pfkc5ZTCqU98yeVYRskqTihzIUX7ywGoerrJNdrozHP+xCr2Z
 dok5FzaT7lw8fiixUll9SuaXNZA+pVQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010060

Enable the iris video codec on the kaanapali MTP reference board.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab6b3e3646753a880e4704a1abd503..4463ab8b136c6f3999198e159335e3096e181fd0 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -916,6 +916,12 @@ &gpu_zap_shader {
 	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu40_p2_s7.mbn";
+
+	status = "okay";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.34.1

