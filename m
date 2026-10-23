Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769343;
	b=3zoDw9Yzuy4lQvM4M/miy6dSsLBuzeYvMXSJQyOAnPuh3M5gnO61ntiegZI5PyjB8+qm
	 vnLLXw8StmYw16667NveW5A0g2JyOSCUVr322KOR7PiC8qlMBLgmQCCxmw17rbUoXz4d8
	 ox5vCdt8wRgAL/BetZCnxTcQtIJ/1DcrtMhcOHT4muHrFavadZoO7qs5OUww1nyVFPPHv
	 WhLngLeUfZl9UQ0XQaeIjKsyqJ/ozxw9kdyQpZvE4NX4Ox2w0jVjB8U3OWfKktSF30cHk
	 jYgRjGY/3X44H8ZZMIr5bcLdwEQWSaY5xD9vKvt/gy/p2i7W5TgEZ+AjY8oEQc/9tag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hP9cDN1wb9WrpjhE6GAwvS1GZiLJcF+EYNzuJGH0AN8=;
	b=r8K1osoQ0koh7yG7A7HdH5oYK/zKpQTucQKtwtTcxjHF7JDzgy8VG3HeuCcQHwdO2S3y
	 bKj7n/c48/IM3ulHbPZB900ZvJrc8puLaM8OW42UyHfNXCBhuuOmsCCsnd0WInBPvNJ2J
	 BXMEVO9Y+79pueoXQ3szWjsFc7MC43UhYFb3QKhVlF5Xs0/Fj59qxKpPHUEhQrUvTatOD
	 Tfbx468tN+5pHBhYVHB3ZY00zWObhzeYQOA0mb2I77l+daVMJmfgzxS5x7FLnce46p5R1
	 pppSP2EoacZYOK+dYaQDSKpcnLEQn18prRSPE3JG6afkpzAKNv0iqi8AH59UgN+vBqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhnHfL2n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sw7AZBT+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D20B606A31B
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D20B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhnHfL2n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sw7AZBT+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5wjA2109142
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hP9cDN1wb9WrpjhE6GAwvS1GZiLJcF+EYNz
	uJGH0AN8=; b=JhnHfL2nHvO6BuDO0sx98eXVhu8tGhjfjOpd0VX+YkZspKdg9Jd
	stTytPtrQau4EUhS42KwmDNGi9ePlORhPKoOUtXvONEJLjhQgDVtGucSvOJfiksu
	1LCc9OHx8MXljBFQTDn/M5zF8M57G7DEhmkfH+/lbDGGl+VTxRV51gW3I23a6i5E
	YN1s7OwBIj7+GKUn5q06AUnV2UaZlPZ9Yv0s/hjieEPf9mxbmToiXfeUWo9yktI1
	Z5LpQqzSrgw/+d+Xp9PoJSiqDPKYTmde03JRUuxDhebW8f2rPSIEqphgbzOkH8t6
	kKGDc5fHVcxvAwCT76piPW1dVdPPnD/RAZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms4a2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:29:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f62934ef6so230508985a.3
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769341; x=1793374141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hP9cDN1wb9WrpjhE6GAwvS1GZiLJcF+EYNzuJGH0AN8=;
        b=Sw7AZBT+vOPGeHFrROqofYxcBg/1V/U84eesQRpnoNqHAozAoa4lex+Mv4x9y5a4ES
         Yah7jQjqKmP6SRbsnJNR0nu26Xdo6yWb5g/9Uh+/rP1EKy1RdBjHxc3j9zS9qRLXSUyN
         QKcDbdNvJnWgIV6S0aorwxQZ+b8VwtEx1G06WqqLNbpVseADlgPa0TohFzqDZD23E1M7
         XZ5FgQCdarRYa/CF76tH1pdRZ9FPhWOw927g/KUdQRip4U3YwjHkzZs56lZ7/Xr8mn+Y
         Vm77F5kdfX1J1r0TEqmExOLiFAUIZCsAt0tnVbZwxtuVOtzrpD8bruwBIVvKR9+dIU7m
         r+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769341; x=1793374141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hP9cDN1wb9WrpjhE6GAwvS1GZiLJcF+EYNzuJGH0AN8=;
        b=yb2iLEOV9Yn2pEj/DWTL4hW+IdzhJ6zXSZHWsKtEu7/NR+uaQQL1w4CnR+i2uotGxj
         DMxXa9W2V8/DXP3HEvOD90NJZNKAbTLUIZpOOctMHBTRY37OWLn/FE+9ho4zVltWQQq9
         fKrofvrUqMCUR2ob9X2ip6sPa5Rs4l3btsV6pkhHkFtnDM+LNSuVcyAUTp5ZvyyEXUWJ
         zRuO+yytVcmfDmq0GpgDb7Hv8F5KjiYz3KwOVQZIKLkBcGqfEH+X52LP4hjpvHNA0pFh
         SSpRp5Yym21hMO/6XDIi2RG3/3VRQ5zLOe/wniKaidDw0Gno4LfUCRqMfdsw+DC1PmVC
         zRWg==
X-Forwarded-Encrypted: i=1; AKwUvBz3+ILLGJCB2NOXyBNs2Nb9/0+Gc8vLDQzZKEB2S3baQs2JvFOtFwVuqNh+5GKMfq2s86zoqdYmsRiFFQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIr258G10P15h0fLxVeuP2RxAzjCU/KejQPL05nyBFygF1J37Ib
	5rpxKBbcXbDuFYMuj4ra9nHH0hIhsWiQSDDaCtZzZkhs0mehwHNhj26Ip6r1bMr0HgISwYtv5QI
	dvYkah0yLNKAFmBG/YlHFewTfuoGVuOVyS9a1dmAD6+B7ggttfVOtBAPXFFY84RNQjQ==
X-Gm-Gg: AYBFou0jGEvAycgtn/2kq1MqWaa9AxcxzasqYkx/ucgXUd5URjvLP/xyFvH9K/EKBsN
	mfVAIEtU5/h8meDkOEU83MAp4LAyAkJu3+VdnWWItPdq6eR27tlM7zhnVbAr6HjD8u2jU97HYOT
	MY20BaLuLr8NLMI4IDhMIAOH/k4GwS4yTN1fgLHaD4WdVtK6ZdNKEjEje9bVTSLtP4WCO8gTUjQ
	jcKhOgzpy9B1i/XnFJgKASbQmk1ALrmG1faaN28ujqDHFMBp8Obhw9/6oBuPImFwDp8ownaM2/w
	9H8vuSOpxO8eCQd7l11R2Dw50YFtYs+QnR4wrIDGFdxwOo5KmNXZ0PlfabYpVRLPtdLs8qFIoEJ
	Y/iRir5sl8jxp1YqOIzlFe/fG
X-Received: by 2002:a05:620a:261e:b0:93e:60e8:c9ad with SMTP id af79cd13be357-93f6f58ded3mr466609885a.12.1792769341434;
        Fri, 23 Oct 2026 08:29:01 -0700 (PDT)
X-Received: by 2002:a05:620a:261e:b0:93e:60e8:c9ad with SMTP id af79cd13be357-93f6f58ded3mr466606385a.12.1792769340969;
        Fri, 23 Oct 2026 08:29:00 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fb9b90sm5546425e9.4.2026.10.23.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:28:59 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: qcom: camss: share VFE clock sources on SM8250
Date: Fri, 23 Oct 2026 18:28:53 +0300
Message-Id: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX5rgfcEZWuJcL
 l3TN4U40wMVrwvb1icd324bekF4xLk1hMjAM3ElZGsY5OrYIleYA68Yexrg/xJB7nH+DASlqtUw
 FCq3beDYrBFF8ZMQ6tlq7PI8mpBwzACe9ozToshZxZs7jcV+aXgOpnW0HAAUxHw7+aRSHZK2WyJ
 d6edC5BBRKWmMXtSTdD67txIdvPcWgdzJb0rZNDah8ZB3vA/256DYHBI0n4lnJLc1BX/J8LXFDh
 DmyGCQ26VpNdnaNgED4q/VrgiinP/wuVS+Ah2TF7VTwJC2KRf2I2tvOt9WAtAxK1ElQ7FSGzH/H
 qJvRPJGwfHT+xEQSrn5D3VLwf9nlrjnqIeF3x1xNeGrxSPRs2671wh3rrTW9eC7Exfk/rji8n8/
 kXOXhNUuXfH09zmQUgUcLEeUooJHibcxChlYRAQPmrCWHQId/nNL7aUNBnlEl+iHD0wWZhBo8mX
 v0Z3UTfsOIfPQrB+7gg==
X-Proofpoint-GUID: D_EXblf-3cXBXlMo7DOifrh7c-jrA8Dl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX4mW2hBDTN/1b
 lNZphnSHO5JAFjeGz8qAwWJ1ido0R8VN57SaD1sXKOiZb9IIeClG5WgtchBaXd4S0MuR2HtNo2z
 rZzWeMIgkNSQumsA+PVfJvYS9KuCXWU=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb7d3e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=zMOfFELr6_fzUAOyo_gA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: D_EXblf-3cXBXlMo7DOifrh7c-jrA8Dl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230060

On SM8250 several VFE clocks are fed by one clock source: the AREG
clocks of the two full VFEs share the fast AHB source, the two VFE Lite
share one core clock source, and all four VFEs share the camera NoC AXI
source. Each VFE sets such a source to its own rate, so the last VFE to
power on wins and can lower the rate under a VFE that is still running.
The CSID also sets the VFE core clocks to their lowest level when it
powers on after the VFE, and nothing sets the camera NoC AXI rate, so
the camera NoC runs from XO and two concurrent streams stall.

This series lets the VFE own its clock rates and aggregates the shared
sources within CAMSS:

- Patch 1 clamps each VFE clock to its highest listed rate instead of
  failing, as the VFE clock rate tables need not have the same number
  of levels.
- Patch 2 stops the CSID from setting the VFE core clock rates.
- Patch 3 groups the VFE clocks by clock source, so that a shared
  source runs at the highest rate requested by the running VFEs. It is
  enabled per SoC, so far only on SM8250, and also lets the VFE set the
  AREG clock rate.
- Patch 4 drops the unused camera NoC AXI RCG from the VFE clocks and
  lets the VFE set the camera NoC AXI rate.

The aggregation only covers the CAMSS VFEs. Drivers outside CAMSS that
use the same shared clock sources are not covered and are left to a
separate change.

Tested on RB5 (QRB5165) with imx577 and ov9282 sensors and the CSID test
pattern generator, on single, concurrent test pattern plus sensor, and
concurrent dual sensor RDI captures on all four VFEs: all streams
complete, the shared sources stay at the highest requested rate while
another VFE runs, dedicated clocks drop to XO on power off, and the
camera NoC AXI clock runs at 300 or 400 MHz while streaming, without
the concurrent capture stalls seen before the series.

Atanas Filipov (4):
  media: qcom: camss: clamp VFE clock rates to the highest level
  media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
  media: qcom: camss: share VFE clock sources by the highest rate
  media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE

 drivers/media/platform/qcom/camss/camss-vfe.c |  32 ++-
 drivers/media/platform/qcom/camss/camss.c     | 211 ++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h     |  13 ++
 3 files changed, 224 insertions(+), 32 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.34.1

