Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770A448822B
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363763; cv=none; b=UymRdg2XQE9weKO1JT0CFWW6ZMf5zT08X/NaEQG3aad6rB6c1qpOk+SWIZerChLimyf94Jw8qvdMPOo127oaE43ybRmDdM98LEyvb8LWORzZQZGHETUYLpaH9ljWv31EHd0iqildl2uHnfQmdTgZzdFYU33p4ZKBYqUbdJfaWJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363763; c=relaxed/simple;
	bh=V1+LIzhsNCYGghySNC0huQ8BjohirEoPB9lOPfSjmNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aWgns0pMP6G0nMDMXVAexKXqNi6oxcfrm4qscY44+rr0FFZFmJ7ArpNcWrSSXrzKfToVEJihLNVio+FCVuSiZPCLE2pIxyb6z6iufnFC4G/MnjSegB7zk0nCovv0AfZRKyeKIuxXj/rNZ4oKKZvZ5zC4wc0P9HkO3Mti1yNokQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2/FpBNM reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2/FpBNM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jaP61873502
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wAbK+q4lPjl
	daIW60C/b3RXYI3mjruIC3tTZr7L08yQ=; b=I2/FpBNMsAE2T7Myntk2s+fk+xz
	mXWDmacwlp+99yQAGAUARMVGXFpnRb8gotJd/M9zLKP7VxV/A7u734it/SpN24L6
	H0A0rII5hb2kkBPN0uTD/hKa6oPrht12k6vyq0MQRtqARQDw3AQEOxm1CxpkSBKu
	gSCzO3Q1S8F2VhITuJqF1M+rvi5TJAU4I2sjkAcFVFtvG6vwOrwebv6t3Ia94Iml
	TNvwkO//uJmImKmEtCHkGjXNRxIXvjZKHT86AVP8Es12jRyB0hLzJdlv2p9F6U1M
	ts+qRBkemifnj9EBOmOis5ynAPOPBiU+u6Q74x/fEyc68l1FgGg37mTe+yQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rnkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:02:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso738910885a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363732; x=1791968532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAbK+q4lPjldaIW60C/b3RXYI3mjruIC3tTZr7L08yQ=;
        b=KLyUTE5ySUmN43dT9d8P1CqiBBwFm/wIAoUTq2c0NT6dK4ZjwNLKaqBxp3g/NAu4XK
         rmKgssCAJTJz0lILD1s5au9NcznRxqNRqA88xMAQZvpcHrs9h75m8N0fYY7CiU7DGmx4
         HpkXHIJXbayHEc1bWpj0RQIUnuy3F9l9lebqAhGiAJ/StLI2drmiB5I3/m7VFgb8vcif
         sZ6LunGM5BUJQ2vczS15zyARADmV4rWCC5kRpw71waFy+eAqyHP1EhbVA0GQWWfG9rPt
         1EijWGoaOwwxyh3k5a5if3V2PivAphzFzPypUHINweQ1/LCosLkSUwsXKiFb+zeoqNCo
         sAAg==
X-Forwarded-Encrypted: i=1; AKwUvBwTetNZnV4A+9RAFGqRXuvD/RQlMWJGnTikPy+I/4XuuRwjfmux0/Rkz9VMj/l1G+kGv3SVweoL5sR1EQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kdGBTYIA6Chg9mlVD8cw2hD4i+MHF8CNHoX/JFnVCkXX02nO9J
	OHH4SsnYCbCQlu09ydDuwTaDLzJ62N2fRZfHveIRpji8kJ3+P3nJOm2VHaPabeguFPERkf9iH5k
	fUbq+zMwnJ/UL+P6/iPMKYp4JXbx9qWo8sxXesm0GMNttm/R1bqwevgnyn7BYTC8u2A==
X-Gm-Gg: AYBFou0wKOyJX5gfHZD47+hxrHQ9OIow0Xl1lBrM/E/1uUOPJMBa3ZD6ojPafjzWdd/
	d1c39NN4T+3JSiM8g8UCBwYZ9+5gMLqGs47+1++TddQobPVl/yCf7vbEC2xxsiauOZby9ZzaJVS
	HoJk0IJoa/LCLYQ89do5xFlH492pCKkcW2w0vb7rOzjGkghT7p7/s8zkHd2W2cfHZlps1FieHLG
	VAfl0cECpJzznqhOp+pBY3dUAjmArRQLFk0HXF1xJ1MWtJSVvxk24BF8hgA0tg/8s/n5ICL20r+
	AY2+4FWRP2v/IxoRvDKlbbqu9Tkz2Rzw+bXHDpGF8/Q38XIsBWQsWKe/FJg=
X-Received: by 2002:a05:620a:660a:b0:93e:9808:2e1b with SMTP id af79cd13be357-93e98082ea4mr447762385a.40.1791363732314;
        Wed, 07 Oct 2026 02:02:12 -0700 (PDT)
X-Received: by 2002:a05:620a:660a:b0:93e:9808:2e1b with SMTP id af79cd13be357-93e98082ea4mr447757485a.40.1791363731820;
        Wed, 07 Oct 2026 02:02:11 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:10 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 24/45] arm64: dts: qcom: use SM8250 IFE resources
Date: Wed,  7 Oct 2026 12:00:20 +0300
Message-Id: <20261007090041.3732717-25-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX3vywfhJdH2Lp
 BMKZbVfKo0sdpiF3qvU1KQdn44LXSVt1RI9fgMrcn9DFa3B4blDKwUdq9LBlhGWxbDNDohfmRYX
 kgzU33R6zFyYrReC0vPSpRykFQ8DjO4=
X-Proofpoint-ORIG-GUID: vg_AEabam6Pud7-8axLO5-hPmctjT-eO
X-Proofpoint-GUID: vg_AEabam6Pud7-8axLO5-hPmctjT-eO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX+Py0A7SB7Z5/
 Y/OdaagsewqxWw/8nygkSof8f7hGBiWkOnZZ6Lqw3tjFPvpPZ9bee+OtckOEG777/W3105yS7NT
 tJXYvfuc1Azm2tkZ5vh8xhPGeqkUJ2jpp2mNv6hSE074iJSeQqjhntCnYQF+CixdzlTby3Z7DnW
 R/Ei4JesP3lpQ12Qe44buNgwevKsoxfD5rf7UmO5dqh+dsD+KTV1WdR4FdgEBxOScXiAGgpamjR
 XNhelyDhwpiGzNKrdcEk/nvCKLAGqOnlLnlf/LXfkjqZ1gXoCe4A2q2ub78sZdLXWomVlPmBi1z
 mPZMPq/o1mXex/lX6XxXEzBr9D78h7hBTfGWAIIvoT/PV10teVLjEgfp+8nM/akR9sbAmwXioxv
 ZR9lkfudQUDRMuWSZPHV+3Hc9soNkmYUT2rQhpVmeSG1YvQfqTQ68tDCRR7Lmc1MqTMDPDskX/w
 zTs7PHBhfB0xylJxS8Q==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac60a95 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=ucHQKD9_QHzbuw8IWkIA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e..21550d25ebe8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4487,7 +4487,7 @@ cci1_i2c1: i2c-bus@1 {
 		};
 
 		camss: camss@ac6a000 {
-			compatible = "qcom,sm8250-camss";
+			compatible = "qcom,sm8250pix-camss";
 			status = "disabled";
 
 			reg = <0 0x0ac6a000 0 0x2000>,
-- 
2.34.1

