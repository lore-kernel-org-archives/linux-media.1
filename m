Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634819;
	b=SISqqLzz6HcUVVTRIVOg1HSAqDv83CKD4EDEZmp38xDgz6oEU36HUELroWK+oN4gTYil
	 6hQ67bOwa8J0od1A8hFmSm4DsuUHiJg4esrf9FTAyaDR2O8bVzOnoxTmRarpQNmOdhvLs
	 sYQGK8U6HKTXMmAz44/fL9NdCf8GBuHketM0Oj2XHRW5PhF07NmZfSuKyN/mT2Uqerzvf
	 nmMScO0jm/ll1By6JJx23Zvd5sZ/EqN1/XKgvju3a33CYj4kmKozPxAieC55w/y5pWpBT
	 yB2bNbfKpnDU9KjYISmmFUtWHd42BbYmgnMXI+zNuPuyfuoJRrqeMpqHX6d10HemWQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=;
	b=EII+eoilabeZdsZpEBJCddVFtRbVuUOn0xm9zIc3oxwo4PcBczzqgYHtGserJyGuiWHy
	 QfvZM8bpSynALqXZEMLquZb4xA2wibq4y57vXsg2/kwlviv0m+CrBu+xc1ycHg9jc/+Ax
	 sLUXmYbbjcr7CH3MlNQ5K/BREP//r0RtYXOpl9NWSCbx2o4O9f7EPsHan+8BUMiASc0TG
	 7L+Re7CX/3e4TuTyMj+XBsfsvQvMqgEG9rOlUKjiFFmSvbtyUERedjhgKpp/jys0qLGJz
	 QmuzDjxCWlwC8W+GxgSwfcQ0prIlPjs6WIvlyX7tUNCoEkKHHTKyamBcdpDm2/NHWeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XqNFgVM4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLRG+2Yc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4781860B4D0F
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 15:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4781860B4D0F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XqNFgVM4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLRG+2Yc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpON03715852
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 15:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=; b=XqNFgVM4u1/+7jEl
	dfjFJcnji1V5QNjBIpmSXmn0vPhkJV9TvA1kpSQvHMKPKetwC7dL3ojF8efMTG/o
	5Buj2qRIAnQPWkGGoI5vSww6/cISNBqsHC6RdPgBFikN/hchzMiQI5BBpfnG7/dd
	CToucGyxYUZW98YnNEAq0pBCs2+UkufhExCzOXc5/F+kSv39uYP7LqL7DlPHKMDa
	z+1rXyYatSYuoO1Sd5b0BKTndbf++kZXT8AIBVxo9vVmtjmCe759yVBNRHcwqXeF
	vHugSsMwmms246jE5+LFI/2FDaVy2nDDILKK1H4HCGuoF8dMy9V9MHM5Jb6oXPfj
	ydQvXg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka62nux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 15:53:36 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so549375137.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 07:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634816; x=1794239616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=;
        b=KLRG+2YcIHPxUi598sBcmfdva6j+6raPHVitl3xK/5adbiL+9vF3i6ym1j86pSdkHk
         C3iKR2Q0QjZxNX7B8esB5JD5g/YhO6nKXR6XQFt+bRXfXGa31GEL/fC9OYzl6uaGViu5
         Sv4e8JQPS5UD0GmbrkFTC1pfmxfEo1a5FpaBGR5mKyf1kINUv5izYTMlh/ATdCvI1tRB
         WszY4nNGPsC4M1O8oldPMM2Z/5pMlFnuE4NYKnHivBqJqTJNT0SqUHYKOr2VZMohmyL5
         v/+iLRGAPtkqVpDfIhxQmJSxeHcVz+Jiw8NJNcmR90c13OPmvrYGjoAXKdopkP/lm9O0
         2Egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634816; x=1794239616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=;
        b=YqjYm9YBbWMBq5whlGp4BZHvjjZQWp19qojfdOvHRKlvkhumiO7/1KbKT/gmK6imVP
         WCkaNi5VHI5wZBM8rLYvHJezpaskylWbllUG6oGbXEXzAHljTdLGCyGNg/iyo1bUuyPk
         P6PXWa7UX65nhaTmDu3X/dQ5v8E5z/GX97E4sd2TYAyIQIXnjkpDJG1Rn4rMwKqnm6aZ
         5ExEHQn9vpHuG3yAcjQQswxhQrOCtmLhEUSa8xk58R0UftrCI7ExwhOCJwr66MYIgfgK
         5EAMFa0GQ9Ll50ljSzNwj3UHteojEo0rpDjEmngj+MzhV1ARPsRjlRVZDbBPCEE63Bb1
         Vxhw==
X-Gm-Message-State: APuU4Z/TLUQxwTujE5VWygUY2WEg4h1eQk904NzhhHivZMcnCjiwV70C
	vdbnDdaevuMomFGtgqehytCA0fYvmc2Yg2OoCOQJ5tYX0DmZNrMpp7/9H+yV/Si3DhWIkKnA1Fe
	BdN4wsn6HrI1I39tH5VKpVcjAgyjDic4RB/c9PIg1T/2fhe1qGlcZU2eZpTMQVhqPNA==
X-Gm-Gg: AYBFou29Xr//MQb34AD3n3DiMkKhhB7XplYZNKdoYUdIbm0CsYQ/Ph7bJvjf7gPVzLY
	DFF6pxtLzHn+eLS++cUcPDnVRlwDEZj+BBZa6ZrcBob8qsIBEfl/Vwao/VzM6efW5a2buLY1aYf
	g3OapuNVgVY2nTQA6bVkfS0bxoxDs8cuPBN03NBHMbbHw0V++gPxVKymCbKVPap1pDT9dXXf9c6
	mkSXP7loZVLhbUBNu8pR4zNqUcOK9b78syoVMFNaPM9SfD3C/jzDrbELh6y9clTl62VPxZUxCNh
	IR3SrR+Gh8xlogsVRY43JJjlbusYH+Jm20tgB9AgB3pcIiEbN7BMnXTPL8V7uiEMOa7Kn4gQ0hs
	ht1J4zadnANMnDRouzo4SJ73ElP+PsTypsl3FWbcvtCRu1SB+qpNrDlPuwCCA9DtO3ItPqHCKUH
	duvxVduzbvOmCIvdHVZNcERlzQjc02fkTaWPHCV2YE+2tno09iXvP+eNK4EAnXoeDE3o6SLp5ig
	UZbB1HuPpsoVS1ECbplPzYM1VRu
X-Received: by 2002:a05:6102:50a8:b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7d072715882mr3862073137.31.1793634815520;
        Mon, 02 Nov 2026 07:53:35 -0800 (PST)
X-Received: by 2002:a05:6102:50a8:b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7d072715882mr3862056137.31.1793634815005;
        Mon, 02 Nov 2026 07:53:35 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:34 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:40 +0100
Subject: [PATCH v12 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-camss-isp-ope-v12-9-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: DPXcI35plCETTIzsDFFYjnYrXGXX_ckH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX/gpBng7vWtVK
 E8O5QJlE9clDKfTrZwMFSwzui0urUSo4GTtRYZVfKRI5hPVinFLgO5m0JNzTEm8k5b4bYxjMVhF
 Dwu/w7YQ8TmDaVr9yZZwh01nEAa9LFE=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae8b200 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX0EFODu+ZuWN9
 JS7scoqDzVP8nq/JT4NFmL11z3UCvpHDHEMvRBlDhG9j6kWgjQTzTZMbYEspubXj13Fb+67buC+
 MnvFSsUzEbTMpUUlbiPtNRjPXj9q8qHHaELrug5fIz5Eswj5hNRtKn/VyZONeNzvWUWD1QEZu3T
 b/3+D0rXR+al1LwiF2cztbUrAgoXfQ4KGHfCea/Acmyl25Jjt5Rk+47x4yMtMl7/DtSIRfvk7E2
 X4u5WMgTA4aH8Kn48j8tYUP1pdkSskF21HqkJiuAbW9O5/G3ico1WIopcMFHx3wrqDZ4/uoaMmd
 fJMixrzr+QiLGHZNLMvmnEBadgxIdZccKEdteMMnGG8zUMv0CAORMSu3oqg4rtB3g+CffIhTB4g
 kg7xjmndi6pWKm87NugwC+/591Z5LDjMxR0LhLi4aGgcQTb92GAfchF06NLedsbitoxc281JmiT
 2SHSbkmn5zcYi+EkI1Q==
X-Proofpoint-GUID: DPXcI35plCETTIzsDFFYjnYrXGXX_ckH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020063

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c440c7912f0a24665bdb7010d9e4..6ce0907bfa8eedccd05c91dca45ad7c18fdb37cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -942,6 +942,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

