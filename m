Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743831;
	b=2zdpkasEtZ+79LvLMcgYAYNM073jOei7tmO6Junz3La6a1D6aaNkVPAeLV/cMZcGkJCk
	 7vBHRnKaYf89Q9tqg/muSNHEUvNTftNjqb9ZJrlZcCm7pzY6dzv0QF8hNiag9yLtbeSa9
	 H+nQ/I3dPG2nAunAjSL23Z1rayQx1qhNJhPEywDsxVtDaLH3jfHHGRGUg37BNWk2y1i/I
	 oqGASbKF6RE/5g9rCB1Lg2pyN9XswoWMsA/T5sGk5cd2RYW2VXzA8g5pupBymUmlICz/F
	 vIbf6Br4xTUJSaz24OHXT8f9YKQAFr/gIAKgtobZV4mA/tDeisA4g1Qd9W14+isoEdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B8btorfIxCaYOICbiS2yq9ZFGUVTKWbfH0CGLMPxdd8=;
	b=y3Rs+WNyhP87LpwEgbBwPTlRvciMutyjL7rHUXZ4L7zzQ8F+SVJjK98CZEmGc0qSD9sW
	 E1Qbr24rdwbbwkHb7KYm5lfzp5hAzsTDBKuKuBHvXOMZr/pHhXppReY2IBFFwYvbebelC
	 Ed4NQ2HrZH0LJXYfsWCRoyp8oo7SjbI4UiznME4ue0IIvuMV22GiJQw2PefVJmUTzGoJY
	 ouYz3zblwSPeXMUrJia1eN33lx6aTvMVRiULnsaD7rUQHPodNMGW0eSG0R2w3y970cyM3
	 6iUhHfTYT8CX/UDY63/nmZuC13TnMsfnSsuFY8aXTAukGb5btUSKf45/bTkgYxjqFYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a+E3TXTA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DC20Xwo9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2944606A326
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 22:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2944606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a+E3TXTA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DC20Xwo9
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKpUH2395537
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 22:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=B8btorfIxCaYOICbiS2yq9ZFGUVTKWbfH0C
	GLMPxdd8=; b=a+E3TXTAtAfPkCzOzNlfiasq7aAxxHyXpI58AYJEdVKtjGrqi4V
	GRvVoAOuvZhfNw8SN3kyDG8v7zYlWN4rOibIzz851iyR/fcaJnjzRFVlVJcVcsAY
	rgHQeNnitb8gtUhGKTQlA2P5TFhqJo7p8A4dEaDoACsnrhc+Gvdbjo+ZBwAbFX+F
	ehXwxc1Q18SB6EvEW7tspcipqThEYe4PxU669F1NrIQwfJRc9g7iCU6zR+WJZiMK
	XsGL79VxonEHwYcx7oUOjTGLdqj5Pk9LGkB/PVBQ9EA0eZnU3jbO5Pd3e8UXyuLf
	HJyZBuxCNNkS9xhSVA2SAvQFAAE4SLABIFw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyd1pfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 22:10:29 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso249803c88.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 14:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793743829; x=1794348629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B8btorfIxCaYOICbiS2yq9ZFGUVTKWbfH0CGLMPxdd8=;
        b=DC20Xwo9leZQo6LCS900ARLquIy+ZqenwhjOznEnP4SgI/nZZCDf7umtlpJ4CZ2k28
         GV3jMZxJs/xiWx1v1qVv31a63nOIGrrNcph5EDj72vGQ0kSva7cCiLublSAyTdQPrhpN
         tLfzL2DCuKREE6wrMcHkuEbyXWpLlTzxTeh6i/OcC9rXnAUVjwwsdn5jqFZCNfEpsR2L
         IGmkLcPDKEmDsyay+uqKbqxj9q/PCNIX+PsDXGLQ1IJ2cG67G3oS0kb7J8MFp2Jw8jLG
         eE4jY2Bf2zc5llimsjLUlTWg3CGbY/77qNXJ96PQc3bVfXl+IjqJf0Xn4yLy2PtFsVaQ
         SS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743829; x=1794348629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8btorfIxCaYOICbiS2yq9ZFGUVTKWbfH0CGLMPxdd8=;
        b=gKHNYbC8NFxRHlukD3j6r7qvOpbJp+pCoSgkyZnyeGQEuX1h4VStETngQO0xyXGfNi
         Uv2AM/GFyD9IzWA+m0wrKc24Ac2uJUoBbixM6TS2rr4X7j8IEIkRcuu8Aitav1uOPXTp
         GIPtfVhW4VugnsT1l3LSpNHm7q7fFPf89iT0YLBVTz8pYFzUlgfI4KplIyHMhTEk4Ro2
         He0Q1vwt79ew2sdEPU3Xcc2GckWpmyO3EhUAKiG5okcqQ3RyNyn7wMhlDj14bCHoDrIM
         axcvrPZcrRUg9Q4zUvacPOP6bKlggVA1FX5xFrcQwLui3scxvYe30Pk8nX8aRGGpXJjC
         GrOw==
X-Forwarded-Encrypted: i=1; AKwUvByM0Oy2EXubUL33qUXyuTrD1in15By+MJ5bQUi/0ks6BX4XsHlNiHyEpevtmr2VegxYJGaK1eTmgceDiQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9oB4F8TzXAC4fW1BTdNTDllXRyamQpDjbdTl3rfkQzSjXIqq6y
	VaxwW3iHLcBiyjsgPoQb7zPy0kZbJq8VqrRgZ8MeawQorPyKyOJDe/gjJ7pdKSuMl4j+eeHCE3+
	MSrv6Ayc0GyHSnIMvAOEJkeADUnffkE2Qk5wU3eBzkhbSjJw7LuNmcE2NOPxR+PHGDQ==
X-Gm-Gg: AYBFou0zSIO2/wKv8YZESgb/3cb0yjS1eHT57WuOS4Ncwz3WO00o4fwB7O3YTZqA7cF
	nPCezAywITXXn74JzvCQnDU8hwJun84861T3JUIgOdW4x91HdwcIqFL9BTx9AORIq+FE74rc2ND
	J9BQIH4TUn+EPf5SaqxbfOFXAS4J82Kq/BtwvUpmIV7YMJx6PrUakdkf6/K8qmYibSS/3Vh9IEv
	GMk/TJvDBwDWiRZEYARfXY7aDRvF3+3nTVIjqZkrE5B242DVmEM7VrMCeslTvr+nWpxebL6UcF9
	OTvJ/7ueKwSEVZgmboTQjJvXou9/VE7xXydGaGLXciBFWI3KRK6dIEarOQOJhm9ND0T/83GdR3k
	hNB/Y/Ef/P3QEbA6VYAa/uIbshJu1jz3omAWnZcnNArZSQwu2mVGMXqcz6HPT0RXPWGHYJTfU+t
	mQCwb+5fI9sdgCc7M/IUN4OdnoU47T
X-Received: by 2002:a05:7022:7f0f:b0:1a2:2da2:b278 with SMTP id a92af1059eb24-1ac59fbf8dcmr21265711c88.14.1793743829139;
        Tue, 03 Nov 2026 14:10:29 -0800 (PST)
X-Received: by 2002:a05:7022:7f0f:b0:1a2:2da2:b278 with SMTP id a92af1059eb24-1ac59fbf8dcmr21265658c88.14.1793743828301;
        Tue, 03 Nov 2026 14:10:28 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm2137312c88.15.2026.11.03.14.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:10:27 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add CSI2 PHY common-phy providers for SA8775P, QCS8300 and SC7280
Date: Tue,  3 Nov 2026 14:10:23 -0800
Message-Id: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aea5bd5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=75llkZfwqvS44bKgfqYA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: 7JtN2E7322GN4iGzYcQtUsYz_AUX_4hc
X-Proofpoint-ORIG-GUID: 7JtN2E7322GN4iGzYcQtUsYz_AUX_4hc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfX1nD62x2urITB
 uLNcjkZRPxVvWqOXUoIk38TIqWEnkS+gbRGCU0fcoJy8GtWMzPGBgqjXNw+Xv6jw4OshK/pOK0H
 rAUlJwtWhDW3sp2e4ZkxF02V3bsxGM8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfXzaH01LjYxHpV
 lIOzxhrZntv4LforbFqUYt4afR/L+LQY7Szlx1B0qm27nS7EsgfNnwQQbDOf9ssmwUTHK6F6L2J
 QFf42rBVXThDfVbeF0Cu/H+LyarQx7xyq7+BduKZovjFv1ulRGeDUmQ7u3FYunQKlF+MPhr3w0g
 4aPyn1ELnaU+5wwQb/D0KYmUnJW6N8jsX1X/+EuD+vO/kng8vlrMaCt240Vb3qdojyQJGijSiOS
 IV5Q9uIe0iKS5bKGtBaYuR21BOSdYibQ4aQrwhov5+G9JBtDfyt6TKYpVH1kD4gCUkBFzNrYpch
 KLWhJPLd7lTK4ZIF63H0ozevkyesRf/R/ib+pxneg4Ce7CgsjTKtgIcZAovFqSHFd/B3OTanBWY
 LddwM/FysZrO8jZa6wmG8ao8nyhHXEwFdTGcxIiaGtbD5hm1XaqXmlRAcpfprinuNFZraN049XY
 Wpy/UVF2QxVSJ84l+Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030088

This series adds devicetree nodes for the generic Qualcomm MIPI CSI2
PHY driver on the three platforms whose compatibles/soc_cfg were added
by the companion "phy: qcom-mipi-csi2: Add D-PHY support for SA8775P,
QCS8300 and SC7280".

Each CSIPHY is exposed as a standalone generic-PHY provider node at
its existing register address, with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing), so that camss_detect_legacy_phy()
picks the non-legacy path once a board wires a sensor through one of
them. The camss node's own reg-names/clocks/interrupts for the
CSIPHYs are left unchanged, so boards that don't use a provider still
fall back to the legacy in-driver CSIPHY handling. All provider nodes
are added disabled by default; a board or camera overlay enables the
one(s) it actually uses.

The three patches are otherwise independent and split one-per-SoC
since each touches a different dtsi file:

 - Patch 1 adds the four SA8775P CSIPHYs (csiphy0-3) as
   qcom,SA8775P-csi2-phy nodes.

 - Patch 2 adds the three QCS8300 CSIPHYs (csiphy0-2) as
   qcom,QCS8300-csi2-phy nodes.

 - Patch 3 adds the five SC7280 CSIPHYs (csiphy0-4) as
   qcom,SC7280-csi2-phy nodes.

This series depends on the compatible strings and soc_cfg entries
introduced by the driver series referenced above and should be applied
on top of it.

Depends-on: https://lore.kernel.org/all/20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com/

Anusha Arun Nandi (3):
  arm64: dts: qcom: lemans: add CSI2 D-PHY common-phy providers
  arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers
  arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi | 140 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 114 ++++++++++++++++++
 3 files changed, 426 insertions(+)

Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

