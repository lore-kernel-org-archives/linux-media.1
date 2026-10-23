Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768178;
	b=UnoTuqBaaIrTH2mVgfhPVfIw30wWMrSlFVChz70bn5kFNkoxu++j53p5aqOk1BX7QwIP
	 3L7+JxHoCjCBadd3zjyuDa4hK9onRaVhlRDzQECthHqYJqkcYNPnF4tCIi37Lb+GLhdPH
	 1gbV0toX+0NdQwRZhqJeQ+KtBNcJZv30cW89tl5+MIGtvgcsTA0IzuL2C4KPjMqxDWpDn
	 A8V854/n9J4PHTld6cwRSMmNVkQjsX6Qz0g678xYMRJNZcuJ+5KwB2G4P6Uv1/UE4MO27
	 O6HGTnP43Di1gaLY5+WTLhZNdA5KcMUVdS6y58IvaEbCBsDar+N7asnkn0nV4nkJxjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
	b=5F53rrYid7f/15IGNkU5wcI0BoWRzK8V+sxDos9j1nxpUMaLbgR8bTPBR2p7KPfD5jWF
	 edQwD9ATvfDJtKXhSH37zNBLe2PzicfNVpCHqDUqqi/qTY7p790L3Z1NLvruPHCLlX+dx
	 kei9tPyyR2UrIHGr2qRjkPcJ0r38yAHdbseXmahu4DI+rhO4+1/vONdXfXUuOlWE5Kn++
	 sThs2vly0l2kH05UB6NeRHV/6B34BG6eN4JiSjnwYmdxl9nO2czZt3nczgkOC12XLBTxC
	 k/klTyNbo+JBAVBczRLKinQIgjx1JBWRznkhNh19WffMlK+5wekhd/U0niaZdDcCXmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gf+4Ox1p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rt19+j7Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0A7606A32E
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB0A7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gf+4Ox1p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rt19+j7Q
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6DxX1955177
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=; b=gf+4Ox1pI1TJJiqp
	t3lu4fUZWLnoa1a2jMZy5jsyEYxcwmUATjZW4xGitP3AHjJFtnOe/ocLMBvIsO3t
	w0Nwc9goGRkql8MWb67cNqSjA0VuxcaYrADgiaQsLanKdSdiI0r8+LVcJDFU6i1I
	Nnjm9gkymXlnNuml2qcv+3d2Li5PjObCfClZRqf5H04cDuuImGk7S/cFRrEeu+Oe
	0UQcklRe1jOBfoxoV6XA8pxrfSNMBGe7FqOZycLyi8D46ZjUhz/j9ZIpfbMZbnUT
	5TpRb0pZiYVqZsXmIULFRH+E687Nsf71gQBvc9Zisimwvj2xWO4c+bLU+4bzEg/7
	F0e81A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbm994-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so199925285a.1
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768176; x=1793372976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
        b=Rt19+j7QgadhsvmGbM3BbYhgP3TYDl6s/nsDBcknPsqOSv4E8ZpZrSh7p3rbVnWXs/
         12GrFPLH5Vpx/j4Zh2F3+9Z9XS1eES73BS3pGnYoQ+XeCXx+FaX55BDJDGpOjIteuz5k
         Lwggz9iJnsM6saA7cjC3DYxQO5eASS/IHzw64TJtMCBfLKNw/sqip5oICaGkyM4J12ds
         7kIDP7q4srVfqM3zeZ7w8Y0CuTwt9uovu8z1PzD3JwEdfJyH+UZ9S2L4v14HATXKkGFf
         5qTKdI8mP4YWmW+hZcTFNqqbuzNvKXSfZ1HuyHRmHFJpgZFKQBG1WueHNKyLG50uRNkt
         J44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768176; x=1793372976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
        b=N/phXgCqrtwuSl/+Q1qsodyWl3ok+jIUEhp3S4XgeeXpgU0kIgfBI3JyvgOIanSqSn
         lf/N1xbKgSr7VTCTdejNr+IH4CW3nBA640kFPWHH2Irmn0ymVrlRaiZxtGYor16SVf17
         6xzCx7PU46lieuvNBBJbe2LpkX7HO1mDqtm/Bt1NpAYby6/MGvTyg6qJcjee6KQPkgiB
         qPWPWvH5HvYBTil6smACfOQZMV8LBbcL2R+Fo+1YMSE/40dWrtJp7no/9OspXF+7MIKR
         cha8XfwSElXSP91+2N06VYQW9iTM7nbaKPq2C8eB8+k8WJZUw19fEGSWw4cfDSPp2kRf
         r2hA==
X-Gm-Message-State: AFq9FYIuDX+OlN+s1riF7m41cUQwE5JuZ0itCcG+qp4ixGOOZ2oYhuFk
	VEkoIy+DSN1f17M60xXwv1S2MbeoQg107rae9dq6mWf3LmjNQegDigmMLxTj6RjyvzQVSEEDIKI
	NyAFyT8e26VJTfoxhQsHvqAXDNzjWkLpddB2scwM81jt65DlwPWFNBWm/niWPQ8gqgw==
X-Gm-Gg: AYBFou2pcmuQDbLdqD8YzBS04uXgBD9tiakcbIbRzCuHqvJGv1VjyuwfPpxz2m5gsIi
	mfzM55vzXRBvHPz5luzZfRzfElkKdOEkSv7hx/M+BhbBpgAMpTq3O2zlk3iYVMLpw2OcNpLrSsM
	2lNSTKrpVV/+3L/A/IA1OtbDR9czxo6zQJvQ3TU0342dRvq2jmnL3cy6fDRPeMNZcLZuU0TsW1u
	FjtiATo/PUybllDoV4FbvLwioBNrm9vHlQLdel865uwvrnrX4cOn7NUcPFMwwbMhhuHyQWqeAEQ
	b4c3b+mcnwBzSzmn5yHtI0ebFN+NyscqtAy4SvPnHXgR2ynQdhWrnBsvAz7AMsQVbLOqwtoLM3M
	LSuMFMer7jIiaySCR5gMa2ZPqctnto9DHq8ejYRP/+V/d3V7qioW5fQa5tnrpzOtsvf1/Sqm9UV
	4AaFZ/VULrNdb01x60P5QThrN1K+GCQCxPgeXBO88Lf6pvuigBGlg=
X-Received: by 2002:a05:620a:2b4d:b0:93e:e111:2778 with SMTP id af79cd13be357-93f626db3bdmr945065685a.14.1792768175955;
        Fri, 23 Oct 2026 08:09:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4d:b0:93e:e111:2778 with SMTP id af79cd13be357-93f626db3bdmr945056585a.14.1792768175420;
        Fri, 23 Oct 2026 08:09:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:12 +0200
Subject: [PATCH v11 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
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
Message-Id: <20261023-camss-isp-ope-v11-1-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX5Tjj8qHpUu1G
 Jg5HSdQv7eZaPin0TLt7+u7WdQV6g2613cBG8BRI0iFTADO6qFNisY2QZI5UF2lNWRmA9Wn4yci
 nN46+nzZWOkfxqeW5Olex4DpqFsbrbk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX8htdSFFvEKyy
 MPVAlTiyapTWEDNZuvUbKxECwavEUJacLDX3dIKUgMyr+Qdj1kKDF3NRfXDqf27q4pw+gzIkr8i
 6xAHJkcR14lL5csq0RV+Yka0FqNeyhEQQyDeTTDS9JX2h4xVpB4j9ianZSfz+F5lFlihaOrx+AJ
 iaBqSLxu0hdH/3Acu4+3cwV5r7Z080WJDwDHsBgifwDLRfr1+BYeyOKUfv+0O0DdiiZsHhngNm5
 O2ZAWGeZAubw+W4RgwwdhbACngB+Yiz+3wG8wfc3z7MV6bQynshpPSqhHln3e3rwKfH0qbgR82S
 YdDV/mpJAAO+wk0zGZcYD/mCbRw8uvbOq2vk0AjiG9jH34p4nwqD7Be2dAeB5OfYMD3sjfWG65M
 lC3qKd9j9O1CuUz+9uxWUxeR349A0zRqFXwuOvo71+n9FdgAmwFUYo5D7ZdrwRy0sXtt9jLDBSp
 uun7TdepE5wmF047+NA==
X-Proofpoint-ORIG-GUID: c-_wiTQGQq4kXe50q9a4AKoJMx1FZ_54
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb78b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: c-_wiTQGQq4kXe50q9a4AKoJMx1FZ_54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
ISP tuning data such as white balance, color correction and chroma
enhancement settings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae707355a134047de646f61fcc2d1512d4c..cef1593c1835070f7b34a8b8c860738fb77f533a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..70208a9443d8ade569f130e2fc3d6beebab6b636 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -893,6 +893,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
 #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1

