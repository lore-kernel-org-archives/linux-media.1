Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655831;
	b=mE0lM20rmrMH6nYGnuAdBvbywlBZECERKvhJ/iL8XkBwrGQN1moxtwiGQCPsJUgBKKos
	 BcwsJfB2tpDCchC/kVKb22GadNEywoqePnXELPIFdv5tLcxx9v3oeddSBXN/uGkIPZWN9
	 nwsLrBlf1wDbuO8b0aMQ9VbXmmtVs107x2sRb+i7NqnM05J7MCJibJ8/h8loTGPsN+8Oc
	 7qRC5V9YqVB9UqdPZ7liHOMySiKEof1+22n4XTOCnmIoQfkFcLvJWjpUo/tiBRpto/5ey
	 5nrB3OFy6jOA+BC6q0X6ey0ICFooGHCtJBDlzEhgmivpzOot4Q9YkdOhqEm9MP7w0Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=;
	b=Z4iejMZnIAUKPdUYdsOk6fwn2vmHTh/8cLDgO4Wp+UgHjfOLnOKAIO/hWYnDONFoxZOK
	 FiMD0srNa512zC1DBRinU5v35YGjtFghw5YsCkx4ZM/rW0iAhyWksGgrVYFggYQJkb0Z9
	 0vJSXozU0+qOtzND8yk9SkVuUGMHtgDs9K0Qu+5phbr4hfl6fgbuJ9aPBAN/2RHdMZz/r
	 Py8gMipXsIcxsOq6v8B3PGpBXjr6UG1dSMPgx78PjvTBb4bB8TWY9a4+bOPm3tTsMypmJ
	 UFsQefR7MW9ZLgsWETrNHGWGE0q68jv9PwaW1pa1T1Ib/fovQMVoBzoqsdrvd7YfAfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UMfat2ax;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YAWRbO2X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD5A606A32E
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD5A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UMfat2ax;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YAWRbO2X
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wRO03276449
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=; b=UMfat2ax+68EdAj/
	tN3OQH3rgy2YMQ7HZ3iUEIoolyUOFJyB9OYDkFHOJnY//GU0Sm5DsAPtFFtfFTmK
	yJABxKn4Xg07JqPfLUxDivHhVzddOr59fr+zdO0x11qOER0GaMcpI1YjU1W25wRi
	v84PQwwfWXgZyCr7yVP3GPZURGj/2H2kHmHATgOqN7iPXoQGnLdbE3zRitsZ1Uek
	2ar2e8nRTbxfbO9nYdXuZ7lSDraPgL4UK/7JbVWf0JJ3m9bOjc2gon+LtUNY8IqC
	XgZmR41ifzSDtkKWKcuoHsjf0yQvsHYyexFpQCe1JDVIZke8XaVWZ8BS0oS3Lq5S
	8SFPnw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqgrd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:30:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91eacf20364so40700736d6.0
        for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655829; x=1795260629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=;
        b=YAWRbO2XjwrEofSNKRgJ+tdVY94h2WEcUXl2+DrXlLWHmWmLTm7aXB66nqV9XQgYKU
         EVZ8DdA+TG6F8hUQ1Ox012hue13MF30WnNsmPNQDVnv3tqxclPU5fum6dNLcH42c5HLe
         UaX6S2Afyb2HvqfEQkA0LIoVBdgO5hUwo1XWIu2NnXeGIaAC/ipeFNffa2EYdC/c/jqe
         WaW3CSGUPc/056L6WYpyF3c0uXV0PhUHv4vwmjOGNR1TPWH6R6FN0Cocn0ONq3U584Cn
         7l3mzsFG6Hzhhxf+kO8paHNgVRPGkDPGgx5KUNu26QGg11QhnayfamenAnN0M1gyAq8b
         CR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655829; x=1795260629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=;
        b=vzk3VPlRpkIomAcMxphCesmOj2WYk9uKobXn6XQU7lidWqoG1u//NHZcm/er/i1hVy
         tUeWxq6LfsIJXCkkUHjT6JIl/46rgYiIEm334WHye8KhYjVnmJEFhjDkp6u4nEXL/qMX
         GXiOFvzw7J51J+p4sXcYGsDs6V2qqFSCts/culqnn9D39Q56u20BlBkp8JstY7oE3ccR
         SubJzgJVbNUKYRlD8P55fzCOgdR5zkPv+hM0qJrhTQG8XX2SbgNtL43fWQ0+a/AQHxVi
         AWAdxSufGvLdcdDa/USo4yxDhrkNHzxmEiHHeaWnOC2KGvGkk6ngzjhJCHLGwj1i+qnE
         x/Nw==
X-Forwarded-Encrypted: i=1; AL+hErFSFnT3sMTzIjtBGrBSsUppXJ7/u9G0+G1pBxd+2CfS9CAm0+j7LW530RCp6hQm86R1Fqe4KgT345aPAw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+JBF9UCNmFZGdQhKHstK1U4JN71kRXveh73dqcC5pKMtBl9k7D
	7ipIvrdddU286jn5ddocKplhepIuUd0kNcSiERUtc03UlIA2Wl6Kb24VkZXVhvyqem+7XfCoHqg
	vZJr6Zu50EtePMO8dgeR1jus745Sxom9SQqNjgTu8VCja+xBqMndahn8CXyDTNNRJkg==
X-Gm-Gg: AYBFou2oP57itnyNqbKeAhrHz/6syq8qDZPpwgECkqtXSYE4SHp2Evf/t6xNGCAuAOE
	bmdNgEe7S2v/cYH0z9/YDMIW+ckD6LZqud33pwMtrSUXXsQpQfd7YGQam388rWMUiFh+6VT+s1N
	3WwrpmYERwm/L/AKQUgIW6Wd1JOEM3ro4Y9VcpEgZFn2JgDayFT4G90+Ui7GtTQHJJ7/rNpkyxw
	BCptrDdNk+DC4vzF9NNBHapcPKbO2wZ/Flg/AQl++0YCAlPxz2GtdHpdZxzZa/UOqo0gzSZKBwI
	mb/YihzgE73ZZojpgIuidFa06kw1NNTA1p2mb+09PPOSGgpO3WjQiYp3A0wH8pHnJKDr9AbUyxV
	QhtDmfoxc7a4pSFY6QskXYhkgOUA8vHT012DKYJbhlVpMXLOr/GF9OT98CDfDu3YPmnrUaFhxuB
	N/WzqvQRemwzqfF9fwxVxP6p/Xpg==
X-Received: by 2002:a05:6214:4a88:b0:91e:7d3b:4dc7 with SMTP id 6a1803df08f44-91f24294007mr84960606d6.58.1794655828862;
        Sat, 14 Nov 2026 03:30:28 -0800 (PST)
X-Received: by 2002:a05:6214:4a88:b0:91e:7d3b:4dc7 with SMTP id 6a1803df08f44-91f24294007mr84960156d6.58.1794655828431;
        Sat, 14 Nov 2026 03:30:28 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:30:27 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:22 +0800
Subject: [PATCH v7 05/23] dt-bindings: i2c: qcom-cci: Document Eliza
 compatible
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-5-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1069;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=61yDOYkYSQzcaMNW502STOCKhR8JM0wrwP3tqxLNiqY=;
 b=ZmGzJUN2j2tTw0MqwLjAcolX1NvdlwsYsUMfPFvO3fQNEEChYTiWO3sjeHeQOIt4y2OG5zUEe
 CeqCoKP/0ZpDr+LXQ7U4OzMgWHKzuzFtWvMJMaE+uaKoldTk+I1xiVq
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af84655 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX/j0vyAGd/cxN
 FocK/UjGCR71ueCEcDVxjcuMtwCOVaxiTtWQkN2CWZpB6FpvLUk0//Igaia7ISuPRX/0Gw6IRvv
 EKS05TKLWKIAyTs0S8AjcwwgCkpzIBk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXyGA5t8eDJTOI
 GwIh58suIRcW/3DhUEewKianiBbX/A9mOXUWF55f06fTcz9jxQMdeCTu4M1u7aJn6bYylzL7x9o
 nerwlzKOGcowTDHa4mkYiRA3UylBm00+IKn1ftFRw8A3jn5+whIUq2gtZLQ9nIED2yATAEO0ouF
 0IpoO2HJrSR5xweft9M/9IOWjcV5ket2XIWwRHR/NMKvtmTjlroLY5uHV6Tdxkgn1mlyDGx67LP
 f7uQ01svrwUDuoo/CU3YysUAvQqnXSgK9XdC5IabYn6ySppdCahtbwQNmapppFIfdmZTOmtrxvB
 TyvBIo3Ohfe8/6vNPPTz1mRAZC9H3PvZI4XBZs6yMlgryKFGSufiiefxRHAtn5Pqf9cMd0rCYoX
 L6g6XJXSCIv1mpovrnGMUTsvPuwazh3+pdOtPPO+umbGeR8fVAQe3zWk1Tgu5C8YUUL3CAKIkVV
 L6+SppBSITo6LBjLCsw==
X-Proofpoint-GUID: CsStiNO_lPrv3LZZnkT1WNHmQZnALIKB
X-Proofpoint-ORIG-GUID: CsStiNO_lPrv3LZZnkT1WNHmQZnALIKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Add Eliza compatible consistent with CAMSS CCI interfaces, falling back
to "qcom,msm8996-cci".

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..f16298d94177f906790c18831bfbcc5557a5accf 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,eliza-cci
               - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
@@ -136,6 +137,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-cci
               - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci

-- 
2.34.1

