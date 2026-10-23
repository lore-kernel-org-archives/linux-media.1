Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768182;
	b=aznh92IS1ChjjD3+wN5ctKIr3fcmz6Nya9QUdHLA8tqnky6vHs+vFYclhi1b1McTmwoo
	 gPWXG9wvpM6v9eR2XskFWgWFupNL8tOYAPNaYhKhEOvOKkeBXJPyQ9apGJo6XMPNxMDVD
	 2CEEfTWR9YpBDMNuqim2rtwuOH/flFGG3cKSnA6yVVUxYCYrmB3BM48Eg7Da94P0nCsqB
	 zO5zS/bVjpG66yp6li5xOdR0b+UER9Q6KIMwD2h0HhWKeEJj2CSr6r5706KGKghQIX/B0
	 0RG2Sao53WDl20EkEiVg8jjqodIw18yyFtxSZNaMPTst2ijqix+ud9xu84hdt83mGqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
	b=Cl8JEVr4bwHk/oICbKTAg42hIEv9OsiSE8uzV2tAUJZFOOIJGBO5WO9kkCUjbgjrpnLB
	 IV5iQSgZYmvg+3L1JFFWAAcGFPxGovXRPuMQ4InxHgnJzK3QK7txZcF+LO3rFvoQwm49U
	 xeJFDXlkpKpjYVly/zLGNIOHulJWf1JsKc5P57aZXO5++AE9nJNDm4H5jTwhPPItjNihE
	 p3x96Jom6D5lB8upeRHr/sKgGb+Ic8s/dr7XcVQzhMkif27kSBYeWGiGC3BbzKl5sPSzp
	 NEiHgrdZGySRAdnqs/jP8jrfW5azRjTn5uRk67g9WT+38HaDJkB41zHDOcLGqlbEgXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7W5gKds;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fokU3ugz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B922606A334
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B922606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7W5gKds;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fokU3ugz
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6KFx2676028
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=; b=n7W5gKdsJEkKaidU
	m27qhM9bZMOjL2rv3vx+3p+Ap1EM//wf+CHUjzMKsTBeSTUsNv2+2P6Z7N25EM4Y
	2zI/aZ//IhxJokKwWv1QjCU/JKh0HbeKcETCWtCoGzqoeSe5ov2v8dXEUN0S/Kpz
	5302ifNKU4bVYdRK7URyFJX6pzxJ+B5T5vMfZJ7mquolTklbUSMWHIPqoLJtIfUs
	F4NVJjUFd7ZPKFZ+8ZsuknSKYk5yAujl/Ue/9FCWmtWPTITSZU9wo6PpLDbmuI3/
	lkYEo0QcIM2cvtp4K+oZWI+8QritfBG2dj4PxB4EGNsUT7THzlFMcud2YHo9owLD
	S/C6SQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahvp04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:40 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99082f450bfso854643241.2
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768179; x=1793372979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=fokU3ugzhK4FNCr7zI4dYcSwI3DDFQNHJxwQKpjE/C4KcTOXj+5hfRQmpvsnbR6A+W
         ACs7xNzeCGHY9moy3G/m1uH/OwqzXxa2i+2jA9A0UP6XSkhiEbpgEDXCO+VCs4b8hG26
         q2BwFpcWhsZt1d68Wg97rK+RVlY8CI0/W1MPVIspLJrKh+mrMJR6HrYpTUB97MgztTlG
         lYm42dfqgeztgY1h2EYZ+FNLTh/UBhqIhdgwVaumEB4TProUGKapohweKXBiXWh9bT67
         1NzK24nMyGVOXF+8hzK9yS40ACRPNK/NQjwKKLcGmEC/WXaQCiu+fON0IMXvk2MbvBXQ
         BomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768179; x=1793372979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=i8M5xkhBC19i9+iVcJcjatfzkFiauSagsKjcr1hc6o+Rd47Gc40CYY7IWdKX6mACmL
         rgOK+AvgyQowlZbSw86uRXtUMXFqirnn/f4ZmkgbmhuiOGp1FoL/+pxdcktvPcc9YD0E
         j+jKb7y+MYYmWio8X7a4T8NvCjLp1aJTcQ3NqDHnAAtGDlNpUqQ2X0DjFbLr+SXNSNEM
         p7IIxSRJRV3uvS0AZhevDvYDt/DI6VbhCVWQCNpqNAa3K8udFUt7GuxhFk8rbDfsbZN2
         h9WUBOpR/UhOzr+HxGbOS8mR1p2GwIN+dTKDPpQmE1deUt1pDYnki2i0Pq7oV25YWbaD
         YKBQ==
X-Gm-Message-State: AFq9FYJ+Cre4lMI0fxkcGSDj8UA5qbKTXI7wKBQ5giN8qRpLsNo0iMiS
	w/cAtaeMwW4Iq/mU7d5PD1qwLY5ah7MKkOn5Jr/GvM6YjjPqrP/RqoXKdXyJRTwxlPWzx5/wMGp
	KQrW0WCGAVa7qota5ir1aMR+lrn3Uu9J5AL9Uc7TDcXlWmYzIjYKYqmCT7YjIG9vDMA==
X-Gm-Gg: AYBFou0XVXHd+jySkL2Oi9oHD0+lU4Dy4EWyJ7OM9WGJRs8r3M6eoLG5zlcl8zd8Bw2
	Whei8Lnorp3sPNWyQgoKZi5+kLEsU17KlzM25v+SzyScpMkNreaV/kb6mbsO+/Ua3R+YbsXi6kX
	nyvj8bO8Orhx0QVTOLhiQrQruk2dsqQuVF7B15XxPkK0pZvAA9ZpxVAkNlYSkE5gliagb3AGOo1
	EyQ+za42MMqrIoYd3MOb5yv1fRFT0WXwo3AUmlfV4aNEIDonfrFBZ8MqZkVivc2GrViqBjff3m2
	7QS6wnEo02brN3TSH8HgCirmzVfOU318OyXE0aKO1QmHK9ufwChk/+QKLQQmRTzg/oZ5elh1uf7
	uI6tjyFKmyEAu0auUDtB3sac6ixh2Z+5y1/F6lbltPaPuEHUyg9wODdNG6K6Yu4DvplOKGMCx1N
	54BybTBiy0qcIn25HFgmBSXcgfImKPDEjwoJ7xlBEHlKv8zDLj27U=
X-Received: by 2002:a05:6102:510b:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7ccc32d9398mr1042185137.14.1792768179505;
        Fri, 23 Oct 2026 08:09:39 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7ccc32d9398mr1042170137.14.1792768179077;
        Fri, 23 Oct 2026 08:09:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:38 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:14 +0200
Subject: [PATCH v11 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
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
Message-Id: <20261023-camss-isp-ope-v11-3-0c2937195298@oss.qualcomm.com>
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
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX3V2hheLkRU1d
 a4/9NNlTeD/eD840+gti3vXlTkIHVimWqYABMfH3A+576mVY7J7rsdd9uSS86ns0FILIvC0SYw9
 oUJdw3jAY6JRWWiqtSzsQb18ZDlU8KI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfXwcyNKNqVbNGb
 4h9+D78FIN0GGmOdwLZHLsvkKJli3QsRDsG7Q+mWs9PmBCw5Lvr0ygPhDT9qt6pI+pc9vlcPD8C
 C1FW9Z54rjxSbyI69HNW0xmWVIW+65uxxtbUntUcT15O0yJb2j3gsnRwfBepIzRZuI8aBDCcxxA
 x4w385VmHe6yyNSFAnPC33+d5zHlLag5suGfwR/ZBAw7v9+0icKHOGVVuwE6RDOBCTuv8TySada
 9NFBQZPo9iHqrNBlPsstnRllfIy2ebuPOYIe75CSZaXd0ohPQWOwKhH5TZwqyoWtV//qF0vKDTZ
 ojOOBC4De+8aY1WibQmN2pqqBNTwbtDxon5GtMbe1/jADcriBO5WxhxKm8Dz6XfZJ52Imo5qws6
 EmtW5Ta6u0qP+onDZiKs/EngXX2DhcvYjZYExMIyGeQZH9+pwYSaxPHpqS0uqd2d+2TsMd6M1nG
 MHK5QFyyK2OGyq6GhVQ==
X-Proofpoint-GUID: 8onKmyVSokqWuMl54tkpjP5daxu8IOsw
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb78b4 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 8onKmyVSokqWuMl54tkpjP5daxu8IOsw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1

