Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71534366DA3
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045134; cv=none; b=mwDz/TjTXvVegEN9XMPbs0hg2Kh+CRuMrNBqQy+SSAZY+3sAd9McwsQRDQ0DlYIDxswl3W+DeSFLxUtW1fNLKEyKlQja2HnRJztV39LZmtwJjl10JunCR7lL5hTXF84dskxEc8yaiSBBMFGpisVpqL+sxhvQLxZvbELIYpb6LKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045134; c=relaxed/simple;
	bh=QMtO0aaK+jEwfLoS/FX/xRFAe8jOcUGQ12dvcUB8g1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWbWoMfGC0sijpB3F97ghQxbvvra95i0LfrMJMQwWY18lq9kOElWfBf0G8VjyuoKGbpq9F6tmT37E+zX8OmRgQUof3INVSyeYiqJv5/bLphrIeNFlJkaL4t0OGVfQvVgaxpfydanxGFx0ri+s34aHO49WlampMH1yrjGgUBUh/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1GwRksO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eq+dIIvi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1GwRksO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eq+dIIvi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5SVBK3858806
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMCoOHF+KRjaR6jwkz18K6wWxQZjA74R5y1B2yqirho=; b=K1GwRksOkSEVHQXf
	5n7T0MfRhQat+SBW+pZX39b1mXmF50QS8Ch6syDFa8piOfRkH7Eq1H12dMAnUETF
	zOtQ7FGdTfBK/49ilvEdf8uZfImByCBnkxcucc9ntmpzU25T0ewwNpnhq0o0u5C4
	IGJyYAEdouiOhukhIkmPzk3nfdGRgDoEbMtBa6q7T5gNEKWCSU0NgGKEMlM/EX4j
	xCOon6TmSt3+VWIv3+HCuz34QAgVXTahfV4Nupq7aGVkDQDelH08b7pSpaOHN1J7
	ppQIex0+eNhnBQt3hWn/cJ6qDMI1G3YS3mqB/niMUJjVtHYNP8QCDCA+F7yGlCIN
	aausBA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7t98x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:52:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbbb9c9bfc3so431505a12.1
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 22:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045130; x=1785649930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMCoOHF+KRjaR6jwkz18K6wWxQZjA74R5y1B2yqirho=;
        b=eq+dIIvi47aFw3re89oZAGWu5LnthGSU1LAOuLqG9ENYZlCLiMRXR7mdzeCVnHumjE
         96oNv4WyJhHpkoWB27Tw8oW6vXgaFwqQAgCWoLG87iZfLA3cYCthHj0jlrEmPQMIldVr
         FWOmHHW1IXCO+oExMclRSj5QKOtfYYkKQRxGSIrBzA2qs2/yyzFCykPBtLMmW+xamF7L
         rNPTW1o96/2TlTQPEY0NTLt0WEdBBOU9paXkthK9LUXT8TOnIZAdsfEUZ6VXkELT9HjG
         NlRL8yfGPT4jqfR5CRDeIdufeydG4QSDtUajE8dKY936oSFZkibgGlWr/tfMfmgyHprQ
         qceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045130; x=1785649930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMCoOHF+KRjaR6jwkz18K6wWxQZjA74R5y1B2yqirho=;
        b=dvxVAPgRZ4tf35+DVa8W6Tz86KWuUiumXQbXH02ovGti2Bj1GKfn8zBXD6ih2oQTDp
         3fwyb+nQuJZGx+9sm/Q9kPVh1UcqZ698b9gf5PSNhBSNkyhK2diF+rtf8qJdTIyn8NmP
         4AbwwvgX1qLGg9grXY6an3PQ7o9CGFfPz44oieamO+MzZ31Col0MLG4U3FW8GwHFkVnF
         ho/xcCocwUtSsXHwZqkDxj1gzhF1j2kAiOy4G8Dg1LMyk8gFwsbQx01sZIsWB2YO7Pal
         Zeh+imwggsCwXX7ho70v+brv8tg7pr2caHhwXmlqanddNFdmit3/9dpBM7eLZibqZUNe
         MfOw==
X-Forwarded-Encrypted: i=1; AHgh+Rqom/Ev62N+6jD6CtsRS/107I0GeqlNgY4MAAVmAG1rNsgqdHmKws6bIV7549WhsaHCZJUF/HmWk1Hufg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVUR++/ePh7Uq6E+LWs4WauxDZv/r0LQuMCRodG19GN36l3nES
	ExzrAUqaCpq+/0TRkaMirzYT+j64oYImAXD0sUNraAhWahbo4DRvwMDnKWdlnaIo4DcIRxbIjRC
	m5mUg18i7nxup/0JnrBZEwJabPJKB18nxoOWp/tkkijWD3LcbUk2gCvvndjN/Tx51Qg==
X-Gm-Gg: AR+sD10hE5aioc0TdwTvVWhqppnhEK0Hl/xl296YGOyTHh16VDuVlCHHEjzTxGWzPJi
	xu7X5OA8Qywvb5JTFMLt8SbiJQ2TB/3g/4GAb5aQMd2qNnFbM3e3H2SYqAF2Y5xaLgLwKJS/jJh
	lM1cGOQLOi4kBiUefhBTmrfB/rYyFycchGzfUuYlSoYYSo1YQYG3Cv97HDzXoX1vSRMX66aaeiT
	8lBILv82Wxdu0FcPbGtcqB0OT0jh2q9N2t7HpOFZqovxa3h22ewAb1yqHcmuXFQmE2GrBOoIqYm
	sZSBPL1S5kxDYEQJ6mezeauyydqQGkI+NekspPveTmbnjuZv1wzWys6gA9syZo/+3zPtyQ1lGJA
	OxsOYweXmfW7HauwlYq56lZvfCJoI4SMIKg==
X-Received: by 2002:a05:6a21:3393:b0:3c3:b57b:628f with SMTP id adf61e73a8af0-3c67df285fcmr4613028637.48.1785045129498;
        Sat, 25 Jul 2026 22:52:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:3393:b0:3c3:b57b:628f with SMTP id adf61e73a8af0-3c67df285fcmr4612994637.48.1785045129054;
        Sat, 25 Jul 2026 22:52:09 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:52:08 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:44 +0530
Subject: [PATCH v10 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-14-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045024; l=1017;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=QMtO0aaK+jEwfLoS/FX/xRFAe8jOcUGQ12dvcUB8g1Y=;
 b=k2vmy+1Hvs+i3tndHQiZE3m0r+Wru7GaVIqoEaaJnGXwex8ucR+WVe9BqSpoha508idHXhkC7
 0jlWG27zHZBAwhrqnLiZ+0Du0lmPXC8wakvmfuDl73IGSbaA4CEy0LP
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: IKFSgrFSabal6gXHWBlFEigPPau-1vCe
X-Proofpoint-GUID: IKFSgrFSabal6gXHWBlFEigPPau-1vCe
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a65a08b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jls_Txh2LmBa37OkJYYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfX13R4kHTL7jV4
 nPJaUNt8AniBg6dK6Od0thBbqpPNJw79V2lS4/ZeAPqkgi/tueWU4Iq69D5YtDOu18DCaJJVh/k
 diYhbka7jJjVnOxWslhwBKQR+L17aruFQg+NGMIARVCU9EnL1S9rDBOByeTocw92d+yLXn9b6i7
 nc3jW2VSbBjqvfnkf2Nt2eZVBBdpVKfNpOXB9tPlDt4AMxpDEQeoOYgsVVwniJvJD6ugKmJYfvb
 1RIkfV4kpNvZQ6DC3TFdELrF6450iSj6dU4/7WW6UFVw6xAuj2KKOtY4r/QpxJhIHnYTdJG3dYs
 Edr5+O+Wz1xGXYKHZyO8xodCneEezCFHe3rf+EN3LCubTRFxChj9cBReSjwBfTNZS22bnzDvCpf
 G7vXF8+u5TkKQduoj4tusqspDSheI2Zw6Bgdo66IC4bh7ZEpWrk3FC+7nGhjaZIpcs4xQ1h6ZLZ
 SWdjtbCc0TrmWxRbxpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfX2FaeftvS4fnv
 CFUwuSuhYMsS545MtzKGUABu+/lQdNLgJPplju5XTm+DQkZvMeST/oY+7kVhmuQOEgtnXjyeqcG
 wXjKgRKw64RCZ90A5j3X/73u7iRobn0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260055

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index c12808abbfe1..b8eed6e99588 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -695,6 +695,16 @@ touchscreen@38 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+
+	video-firmware {
+		iommus = <&apps_smmu 0x19e2 0x0>;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.34.1

