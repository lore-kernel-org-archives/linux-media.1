Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ABB3382FC
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161393; cv=none; b=RDlolvSloGFsh7InQHpH9rkGQdelLXp/4dzzs0JPlsT5qK90Eb/0dlBYgE9Zc3Hxjj060RxKeWUi/9G+5JaBhQi98EARGb2m78PEfMr7UKN/05LJ8WrxAwN4q2nr8h/Ttue0SVzgx6NOYcyAs7+iPh9BdJDvz/XQsnLcKd4esLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161393; c=relaxed/simple;
	bh=ctuK/6HiwLRqeqRuGeloKYVTeCBRG3POhkr+aTcgYJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=auxyFqIMhyLU4yCWgHJrEpDvYlV+j02o7UbVz/FPgoE6jB7pnX8rqUnJVEML01N0GIFUBpEvdQ5B0yxiJTahNaOXnGPj25w83JgzSHUhBE6VN4NK99a4kXmB5RqlOr94OPTNGi/MuUnJVsQc9kA8dd71ljv+trEdAD5kYM21UMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GM9f6lvV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hvV2Y7iW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GM9f6lvV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hvV2Y7iW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3itp1623812
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p2+yCdQB/jtArd20thH867dpS4beyfoNQNW9c5YJugY=; b=GM9f6lvVtMCN58+U
	jI/WITzEvZJek8dR/L461+OjR5qHk8YdOTQ70Arq/FS5kOUn2I1sgO2x/B56Vtti
	dpQZ4sNGTmb6DjUuicEmHNlg7y2N/lOJlw7xMvuFMJdhFnNW1eA3HHU/Oe+zLDrU
	KDpuCK4jDxr1KOwYfrB/g9Cy+RD17bTI5e+FClroCSB5S+XPEV850tu90nNJnol0
	n+blhjtL/iNVrXXz1j12edeeypUG511bDuC8FbmymVqO5HW4Z+rXfbQ+JS5d7jaZ
	a/WptOju/IKbOyIb3HfVFZOOmp48CcZAYPVqilgqGFOOIxcKFYL/m5Zff5ydScgE
	G0ay8A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma3hex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 11:03:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-331b2ec616fso2933371eec.1
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 04:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161385; x=1790766185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2+yCdQB/jtArd20thH867dpS4beyfoNQNW9c5YJugY=;
        b=hvV2Y7iWC6XVSiuij6WN04enrisG2Zoj1pcUgOJZklMvrjftAuq+2odI3xQsp6pS4E
         tMxnQSiStIm+RXXDNza21RIAQyLK7CK3JrRr+qMv4HpQOOYfZAaLUvswa/QXzWZ7ycJu
         VcRTOyTNGqJrJZ6/RqMV8rBWO+hVXYrEjpI2c8gfJMoE9BP0sVrc2U3pfdKcMTzS2cW1
         X8pN+tSLrdnq+FjX+T4v9QoZoxZngy1nXeM3jmsGget/wJLoHxMOuoPanPNxd/8fqM4B
         AfMzeWrvbw7ZclqfBZKF9tbPPKkcrMbv/ank5e2Sr5tCra5bmIWzsV+qf/z6CXpBm2D9
         KMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161385; x=1790766185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2+yCdQB/jtArd20thH867dpS4beyfoNQNW9c5YJugY=;
        b=aN0kkxX06RqO6BYOcVWy9DQzNsXLag5A+WtNtKYtlakeRoJVn+jOsiWPeIhx6lBrbT
         9LKP+uJAVHxKlemoRbfFv05oHCcpFTQmXGN228acKsEVjHJ8yWwvoFH1fbSrSmfn8VsH
         EThEZXRAFab61rtkqIOyID/vVNjbevNOiS48irHsUCW9uxpKu9ejwM7iVbDdTXOFe/nZ
         ZRSC5oz/lNZyP47MnS9f7rsHEgGh22sdBDACq8Gqak1iywR8uhqZ3uL6Rc63tM+/MvAJ
         yv/b9qPeOm7sGVLbg8q9mPpbjWU18whlGVpZyMSlqwXxEJMDRnoxF0pwGyGAD960htkf
         NhVg==
X-Forwarded-Encrypted: i=1; AKwUvBykrmeHttQE6YQVaOwBRJifydpIEIy//LmvZQ0VaGGqvZBP3DnP1LXmu8Ff4hYBOjjW04eh10KZ4L/5KA==@vger.kernel.org
X-Gm-Message-State: AFuF++lswIAORPI4YvOwHv56ZIz9lNgY6pSp12+lsRzU4DBrBOKVljLr
	jfs6vroTFbjnP7o50uilU92vQk6xjLy7Z8lsBJcxcF1DDg0trtrOv7lsZ5ZHXGNhB+3f16w9mHp
	Rx2nxtoCNsxLuzsgomsGNodnUERkCUWqh2UsAASb2uadPZrj4ir2N2zcXrdpgmNKkNw==
X-Gm-Gg: AYBFou2z+LkgB58I2t1ODBOAX7wn/3Anz9e61M/GOY5FxxmXblNq2qExJfPeEokg30v
	26N9CW6/srNxK8ke8bgqWSp9c24RVgKHyzKqgm3pDUK1qz1ILLIKANjK7pPC8f/QdKNipKGDmWv
	icuioXc1V7wjIpnBasm1bE+3tCdEfCKMOnqLzMjaO5BY8EV6ccMs0llAf0AINUkbEEsznHj6Tja
	MtVzn+igjBhbMuq6VyOU5yQh9qvHCEqO4Wuakv2WV0g3KDI8XP3hA70oHlAOlV+Kei15kzjU5GK
	BK8gjbvfYmWmN2S/DA7/zGx1x6gGcVYRtUv1wS0Zy7vILMti5GGvQ/JzJNwwI2eMw+yxoxp6Z41
	4yQcAx9Ewkg1jTEbnYCHkv51Fw/56Uw==
X-Received: by 2002:a05:7300:2a92:b0:33c:284c:d91e with SMTP id 5a478bee46e88-33e8be69a37mr2277728eec.8.1790161384800;
        Wed, 23 Sep 2026 04:03:04 -0700 (PDT)
X-Received: by 2002:a05:7300:2a92:b0:33c:284c:d91e with SMTP id 5a478bee46e88-33e8be69a37mr2277677eec.8.1790161383772;
        Wed, 23 Sep 2026 04:03:03 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:03:01 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:33 +0530
Subject: [PATCH RFC 02/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Hawi and Maili compatibles
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-2-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=1233;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ctuK/6HiwLRqeqRuGeloKYVTeCBRG3POhkr+aTcgYJk=;
 b=Lh7DOMAQqfETftUNiy5JkkIPGXg2/g/HNlPPGbVGYhUAqcHKqWsILjb1aC006XKYSd15bEjq6
 0YMekrnU2QqCYyDF9xN/rOSm1mmfzEY83AkWmPLV76aese6cY0xwyVo
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: imbaAj6-N4sIqkDqjxalaCzVt65eCksN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MyBTYWx0ZWRfX+ub3qgBvraIx
 V5k9Z3yhnKHPGKa3PvrJxwaou7Hsr0/13+iMD5BroL2Eql/g/5prUPljkINHKcEG/F3u4sz2BdM
 YUw5JT81nVUKvYdzyQa5/IzJcvC22es=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MyBTYWx0ZWRfX/a7q1hw5Qi7n
 H2/m0jnnsoSX6Rtyn+QKAwi0Uyc4e3lFmdITRzUNmN0Bmy6RdAqm/BzX5ZPi5x2yEt/5IZp+Mk5
 2/gVYtZfcrMTddCgoSFjAbQ3GDISbK1ug9unpc6V7XzN6CdY3bT0/NxQiLMnNvxq00M3K7gegV8
 zmJ1jGEOePm87VHjoaNPirzzNWHUdeKsCo9WJ1C3duQn75DrYFMXvJ+IOQFheYBbFhuxZbswyht
 jcdm4aHcWzsBePTiVBOTFjsA773iGDQvCX3CilmoqmvwBY2huiYG19Nw3RRXZ/NsUhICuVpaARr
 fs0XG1+qALVpLghesdJJyjZhCDBPmiG6xHH371RtYGT64Z2H3BJ1KFQ9vi5XS2jcYJxz7KsTJuf
 UF75l6BRuLfH1/btrKavtE+8eiNIpOHFIYYrex1AFKeqMWtvvyNBqIRT+UmWg59fM17K8vLPrrM
 E8Hw9Gp1dJuEE9lM9+g==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab3b1e9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hOD64r94luvqyvSWSa0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: imbaAj6-N4sIqkDqjxalaCzVt65eCksN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230043

Hawi and Maili integrate the same CSIPHY IP as Kaanapali with an
identical register interface. Add qcom,hawi-csi2-phy and
qcom,maili-csi2-phy falling back to qcom,kaanapali-csi2-phy.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml      | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 24ca06b97656077cf168e72b2a32f493d9c06af2..84d70e3e5783980bc76807869f00e7d112a046ae 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,9 +16,15 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-csi2-phy
-      - qcom,x1e80100-csi2-phy
+    oneOf:
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
+      - items:
+          - enum:
+              - qcom,hawi-csi2-phy
+              - qcom,maili-csi2-phy
+          - const: qcom,kaanapali-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

