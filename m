Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB6046D568
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 07:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248443; cv=none; b=gOfv+Oc6d86QjEZ0qypbjJHbDzMwuNvhDtJV4xQw6CAwe4Z61Bn+MnJ/Qorhd2TVpy88lqn7XxUhojG7DgVAx+gpU0vxQZ4nQHMgEtXM539+9+jxwlVZD4pdA07f32MxH4JqZge8ji9MpEKUr9cxUN139tfn+UGg+STB0rOM7a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248443; c=relaxed/simple;
	bh=RhYbLOVuCVOj7lB/xe9Vh1IsoRjbmhLfW+6pU4fEYso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILF7n8bDUA3Y9tKsxpqgjsqHE7d8aideQzKMRrFA6mUCVjyxGkLo0VAufdPqtUDFjS1k0i7S0nV5Im16D0VtKbTFBuKLwnKRZypi8eMFYgq7TsNvgkdBicipgm+SD9IoMlbETMogvNQVKpwyXlnj/ktZtwYrAKYoI8FYy5PNTwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eiaaS1Hf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGPhSLIl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eiaaS1Hf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGPhSLIl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681792PN705427
	for <linux-media@vger.kernel.org>; Tue, 1 Sep 2026 07:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aDrmY2QxhsSRbfDjC2+TRp/S+s59Twvb0/++a3Ypvaw=; b=eiaaS1Hf+5qyT4s8
	Q3h/n7e0pLj4pQJZgnSTcy6Zs6NdLE2gg7QiW7v48R2AMZAQr5zrDMb9lJ9EoO9W
	nQNIlyGJHMEDkz2Yc8OMPbX4Ezr48F1cQuETBvDAzixgRSpPyprtn426jNu8W9p6
	myA6o1bJsKjU25vZiLD47k/HjeMOPKbMNd1sFEJJpxHJ5JefE5VRJCJgye2yC9DA
	UdtgHkx6NTl+5025UH5UROGT10UUhfGUlz73YNvnH8Yu+QFSe6E+TSUsl5Vx7m3Y
	3emoZtZNhM4xXwWv1jJsoKpMvBsB7ZX9IgUf7I5AgFlIJASaVc+KSWtcOJew44Tg
	CGInIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsgjme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 07:40:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939187562a1so1104138385a.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 00:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788248440; x=1788853240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDrmY2QxhsSRbfDjC2+TRp/S+s59Twvb0/++a3Ypvaw=;
        b=CGPhSLIlvHY0zQWtAi5a6KGk1X4ABbm4nY0bUokEk/QvnUVkQLba8UKUkEomm9EEEQ
         mDZ/CWOuFRU/l+3Z2LlaNnJpl+JkSAXttkZcZAyX3buPTuE+bwH/HXUpONWVUT8xx5lQ
         eyefn360ytBblyaTDZwmZLRjuCRZro6a06MynUXEU6K7zyxqI9sYtZ5pswXO33JIb9ai
         oeAHhzFXhMH/T4SKkb3IgG75A1NeuZvCc425ONJvQQqSgSKmFbq2g7v2gGoKjuTwEncr
         MGTLJ8xe0CVumOCy3WI9n/6QdqtIf5181Brr7sI29nwGraHL2tsapnBNsvsc0xGFm8NG
         oQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248440; x=1788853240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDrmY2QxhsSRbfDjC2+TRp/S+s59Twvb0/++a3Ypvaw=;
        b=m6JB+gJ9NU9u2zViIa47Ehy0U7zRww4Jrn8qapO7PCw6QgJC9H5+/g/9OGS+R4O//m
         N92K6InELIEV8d/hhHccL4LJ3MacqEF9vKNl8rGmK9uKTWkfGFUIjFlHE/SNhg7+XVPp
         wecsCXgaFGShHk/qkiMGvK5vHdZ5vw9ntwCXE4wAjIG9MlLbNLsX2oP4wb1zZprjTPg/
         laU79gAo7DxtAcM15Mh6vxD+YU7nFE7ovOkjCziyY0JZuvFg2uqXqW+S/HBXUsyiPtQu
         0G8n8a0+4HMoVhm+L0eokpqi5nSHYx6cyIP9swtlMI0Nz362FqxclBUTTZckCdiCglY8
         EXAg==
X-Gm-Message-State: AFuF++n9Bjl+VSz3s2WtvVotUyz6YJaLTCzCuUFjIGisEJaSzHaVW/lX
	2T0R7A8KXBhIDuarDZQeuzCQBCl9Xvt+Ih89lWq0XJfgvQ/74lgbMBbr8XzxDra8TTohaJROvlK
	qFJc8AmgfwEEWDkCIitc5R2b3lVlBd/8NieFT1o85v8zp9u9q8sZjb1Tw+O+NJKdZgg==
X-Gm-Gg: AR+sD1225mFZFYVCOq06oHsQs1zv7hRqld9NUWACfeeQA8G1BAKlybhT2ffUYvsEZz2
	pWeQT2dWrIsekUPPIYMeHGh4qwMO8ShAcAKzIcPXWi7r3l9mriaMPEgbql6CwzymU4CJELTPmYH
	y8YMh70UHBm7i/WVHkEIK8dQdtBbHqDMoCtdFJHOh/Wz7zjA6VX7aDPnhouEBkPdt3D4JkjunfS
	qpf0BgQZsUFz4oxHlyMBl6NOY2A69YibnT4+PnjizANzJJbONAmHKZp2CSspXHs5DNNBNcJQdjg
	JHaokkc0ehIUYrndB0H8ln2dPZK5q3OsHoQpiFUVvBHt2uxVWriRo25zk8kRwd00u3aV8pubiwZ
	XxDf7hCdEzeXDRF3PFqJd3uD6K3PuntOgGzXZHA7QsBePoE2ErEAPPTV1DRkdW65X4wvz
X-Received: by 2002:a05:620a:46a2:b0:930:f129:1a45 with SMTP id af79cd13be357-93913923d59mr3373548785a.30.1788248440320;
        Tue, 01 Sep 2026 00:40:40 -0700 (PDT)
X-Received: by 2002:a05:620a:46a2:b0:930:f129:1a45 with SMTP id af79cd13be357-93913923d59mr3373543685a.30.1788248439803;
        Tue, 01 Sep 2026 00:40:39 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173f2758sm960412685a.37.2026.09.01.00.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:40:39 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 15:40:05 +0800
Subject: [PATCH v6 2/4] media: i2c: og0ve1b: Use monochrome-appropriate
 test pattern name
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-og0va1b-v6-2-a05b2d04c892@oss.qualcomm.com>
References: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
In-Reply-To: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788248425; l=907;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=RhYbLOVuCVOj7lB/xe9Vh1IsoRjbmhLfW+6pU4fEYso=;
 b=qaTbVgTFvLg6O4pT5iGS0YrMcz44At9ZTuK2U2ofrrKOtcKYhfCnWjcbIV11t0hjlDkn2IGvs
 crsQIsBDLykAlvDZIHcsvtBtXK3VSBBD5Mc8imDaNLfSlwJ/JJ0Bk46
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NyBTYWx0ZWRfX8HMTdoNv+0qW
 VqUu8+gXjMgQK0uJnq6kZ5gxP5hQO5A2HwUkQtThFMTvWoh3R+bfQp2sW4JOyabSqybaIJLtnAP
 1nNCGmDp8z9OYAM337HGpgJhHnAJfXI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NyBTYWx0ZWRfXxk6umu0YuoYD
 aV0nS+zISbe42HrvFu+60ia7X6aNaFeKjKtL/975+xBIyURwXoT0bvBnmLtKrXveWQc4xg4h3uP
 8YPjsqnAJC5PZEBTxy83EZBF0ocJiMJf9a+ahGgha3HYWa/8K4YxGhJ1MLn3Lk1MqcLX5Vt4vRr
 6xF18peWg0YjowM5Pjl8qzlIdk+YKQ4ijjLQ0ph2qspZprtmHVvOBDpLt8RuG//iM9MKRhdA0cD
 6IbsK0nS4EXoKmZP9+gcqW7YwR9D6KN4IEwKWz2Jp2875eAhzq5hT2q3TAPbEhKg3VBekW3M/wk
 xqIbZabjkkpqUKQ9MGrFfFiS3GBPtShf1Eo6iWjI95b4T0HwSR+KMET731l9fn6Qv4dlcD19iDP
 XSDiDeU6Yqs5wMyQK1hZ+aDdt3B6Ih/u5yjrLzku6GutECJa5dNGXjQUsiEHmwBIelTcF4yT/cV
 KzwP5sN4H7stunVl/gQ==
X-Proofpoint-GUID: FhpopKKTFsvPFuSk0W1vR0irvvvMWeyV
X-Proofpoint-ORIG-GUID: FhpopKKTFsvPFuSk0W1vR0irvvvMWeyV
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a968179 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_aklYIXRtum3iaRq27IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010067

OG0VE1B is a monochrome sensor and cannot produce coloured test
patterns, so the "Vertical Colour Bars" test pattern name is misleading.
Rename it to "Standard Test Bar" to match the OG0VA1B naming.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..da5c8e49d4a811f55736bd89c6922856f2e7391c 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -72,7 +72,7 @@ struct og0ve1b_mode {
 
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
-	"Vertical Colour Bars",
+	"Standard Test Bar",
 };
 
 static const char * const og0ve1b_supply_names[] = {

-- 
2.34.1

