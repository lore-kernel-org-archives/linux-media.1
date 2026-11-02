Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616152;
	b=q6muhBvPATevsAusu9/Y7Xv+2sWJJmfPXwoxzDhHynfRzLdVptzxJmENLlgi+pIz5buP
	 vAnwEc51sHSaFEewkXktF958sWTz7R0UA5b4mVCkAzf55PtdkhqYSom5ZkZMdHruRKPsR
	 iWlIJBNhzkn3ap5qd3+XOC3QfnNRsHKt1LUkLCcHHiQ87q8f4q/BPVE16rjJ9NEwar/Y6
	 5M6Y+K1Ylma3sVkOfOy8xiHCkYwf5h9TIEdoofJ2azRA5XSVWGEt02Kczbq97G4pdCRgg
	 VVaOGHAvwH+Wk6dUjkdiAfZTBvrwkLG/ewckwK30JDyisDaduIhg/nV3W7QyRIt4iMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=;
	b=I6zaVJO6c8ebDwDxy/hH5QuZR8f5D1vnAMQh+1hOwM4Uxmm39vsR+6+ueqpwJfu13Gyk
	 YwyA4RHGq2EdSV1YJHy8b1j9aA0mId3N/mwqFVr4AyaMkdKyLXvuVO8MWRYFJmm6hmt5B
	 to4YfbNag4u/fgOVezUlX/cnLKo8ZshIFxx2QhQwZhx4kDgL/HSUc+aoBs6F8kBc2tskl
	 2/oVzcPL87DsoinsSotWJD4i3VAqGyt+7DV58VhiMqghmJDRxvWW1d3tKyo3RzHghTWu0
	 Th1j/qvEtvrjU6Hug/EPen5SDYHf8BEDsTJObYX1sau2UAIc7+j/4HGkQA1tZIDxOUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="feLuO0l/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRPg2O75;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD4C60A3812
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAD4C60A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=feLuO0l/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRPg2O75
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B2Qc4015094
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 10:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=; b=feLuO0l/CT2ghoed
	uWCaqsIZ2w3ODay8cdCXrpqJJAlh3aK0fZ6dgD0motSnF7FBmwAUNfcI8j2jNpoH
	wZL2zQ48H40pkLtHNzjSuaZx9hVzE3e2cUi87n0AdL/iX/lfYvixOAgtIkm9toqv
	OIuid24eBWkfw7rBeyamFIVa2+tmGVWBBPKBB2bBxWzV/sJMcKZ0DSb6oF2AB7tl
	TGkWkB/IsAd4UmrEJdONMYIoAv4ZSxwQAYg+ky/QN/uWE0prZj23nG7I12TywpuX
	hR+3Q/I3JbsE79i7GV7+/TTzdclL9Ccz9yQQEtIdrX3Rja2f2T7syKYUic1sYfNI
	/qi0kg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6pmg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 10:42:30 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-82315dbce25so1620859a34.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 02:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616150; x=1794220950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=;
        b=DRPg2O75oPKSxOXYQNbqEtY/HvWI4vPlEEzIw/cRp2iimgyHDxfebX62QPSais2HUg
         abMcx2aDq3DpEl3LZG/sY3btJIwMUDx5ZgIpjpukEbd59jy/qk4BuBmEA40LxQpxTc6F
         PWwucg0SDTR3RpJbjhD8/F2eEkeCp4CuRMnKp1DytBh1xGn5nWNl3BgRDt+Q1XEbGCvp
         xXr1F0be9KloMEtWNbS0FBsA9I/MK33hmElQCvKHgJ3n3IUwDIe0Zr+BKNZQqhXBW2zu
         biKWtTjz4nOj82KwlMHEJqE+jXw5F2FW5mVPpWknZxxl/00OpctP5okPmVYTTq3uQP+i
         TxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616150; x=1794220950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IAj9mpmnJdc/Aq9gDDAyq0+2DmJDWgCFiwFRYx3AJ/s=;
        b=ayDwl2K+ZHmO8TxYbK3OuE61MPZqibJ0+vPHiESdW9w/+qIJp4Lu6eT/06h4mi0RlD
         V8YDEuVv3PiIiyFec+Oi1LVwaH+xecIx4fw+VyQQYYsxxUF2F4TLEEw2n6skKO+sdHJK
         DNUAlPOiEGGFD74nr/OeOxfzA1BJaUq052PG4ycH1U9aYKh34S6QWlzRth+C1g3ClUR6
         NnUmAcH5qXjW9pOx2PVJT7H1mL6HvWi6cs+Cajd2dtPoWy9vaAAidlmRd5S6wM/W8PsR
         f7/BI8i4l/FceN+UP9OxouSgKQeATbrcrIxaG2tSHT218dLM6v16RlGrKIzqkyhlv3Q9
         PvVA==
X-Forwarded-Encrypted: i=1; AKwUvBzYXyuvlUtNiIwWdipyMEdwDNHKgnh0EFautvSsd0zvsyluk6cZQo7OxOqDykkck79OC6slNN6P2m8MHw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJbK4W0KB1L5CDbk5vTU2XcDFk7Go35dPITNPJGcOZVtoxNRgPV
	c9/R9NRtBpfbuYwbys+SKur4NPDoG1YsEhwsfLUjU2OgMu8Qdov0CoNm08C5vEH2Rw1GIQerUVq
	QhTMUCxXFXYDxZRRFIddz9keMGkWzE8asROXsR3WO0eNTvETEfe2KnLPlBeTNehT1XQ==
X-Gm-Gg: AYBFou0rc7Ttlur2qJMcS9rtYjxTqopv2ofxDib75fUMmeIBald07AyNo6REZ8rl1O+
	Gc3/9C+UowgMoYMjzFnOyFHk7UhGZrbGw4I092h0oPg5pqHCFQ1s7fIKiM+s98iBLxi8czaFjwV
	a2cVXd61eKKCCwFLVcVJAV2+SHzFVQbfkjA/vTpN99thbAcHBmIYJgxJC8SpoWf+ipsKgt88z2K
	CHlevI+dTEUj+i1zIH4K1cFfW9hENIv4I8SsueFqjkkcFg8GtrksXYbBu1Z7ZoZEi2YkGIj80wD
	RfWxOekRllIXcinvYzxJHhpJf29pBrT3WatvQAcyV7SqpddY9o3Y8isdkXdf7cKFoDHe8gFmNrt
	H2F6zhEKnxWIwk3Nrwzz3+rHui663vggknK3CnpxCH0Ltym5CsJ2BcGaaSH5/A/KZ6lu4YFkFs4
	qRH1xWUH7RIy/aW5JxxMfCkQe8MUsPwj7ebJcx+1xledSsBKx6wIIliObJFvk=
X-Received: by 2002:a05:6809:1c:20b0:4fa:8d48:3a6a with SMTP id 5614622812f47-5640dc2a78bmr4290367b6e.18.1793616149915;
        Mon, 02 Nov 2026 02:42:29 -0800 (PST)
X-Received: by 2002:a05:6809:1c:20b0:4fa:8d48:3a6a with SMTP id 5614622812f47-5640dc2a78bmr4290357b6e.18.1793616149487;
        Mon, 02 Nov 2026 02:42:29 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:29 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:15 -0800
Subject: [PATCH v24 07/15] media: qcom: camss: Add PM clock definitions for
 Kaanapali
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
Message-Id: <20261102-kaanapali-camss-v24-7-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: Y9-guWDR9feAhuWAK-uQHPCI9XAa2xo4
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae86916 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3_5DbsQPI53TjtTAKikA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Y9-guWDR9feAhuWAK-uQHPCI9XAa2xo4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXzZGeDtmXU5j3
 xixl38gIwkQWVT8rxyrC+6iCIwCcun5TOQ9U3uOF8bmcsxCf2Su1txEsDzrJAJgkLnHoEvaYwr/
 5OsDcZrjS4Mu3LEI+vl0dqIBkWRMDkI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXySRrpTp6fpsc
 1LI0UDWOmVOv5vR2dtkhe3yvJfGSPX7ZgZVLITZ368oqQFKDjwgX4LpyIQH6diU5yioKrB45Auj
 He1RTwsg8MVLIF9VP0SdMCL25CksoUvmvPBqNVjhi8VHEcTnFDuSGbW4Bq2Ulc42vnFee7SW+Vt
 gJWzTGTzSf9zGAGh++7eHPMhMJS4QlyxwV+yT37jfIDiFjDcHr8WEhc5xmVoBd8LeeYWuiWinIJ
 afr6OuV9S4NFV1nNYQZTY5+ien2kGbibf2doY4PKYASPZNUNOTT9eHqwyuud+TiyjXMbeYfL5b+
 n6y9qdye9FAJlu6Fa1jOgdAlXRahZbOsZ6oZ9dTAn7/IZnzukU06AoDU3LbWytc9tiB1pho8RLU
 4JuShTKPxNmqp2LAPFU9QPFNvBCKEVcUOGm/VF1VrYRDviIrgbYdMA08tXA5Bn1svLCQ5/2fOst
 o9Z+4T8hZEkdViIM2AA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
sub-block. Register them as PM clocks so the PM clock framework enables
them once when CAMSS resumes, instead of each sub-block listing them and
taking its own reference.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 385be682e8b9..3857515aac7c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5606,6 +5606,7 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_kaanapali,
 	.tpg_res = tpg_res_8775p,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),

-- 
2.34.1

