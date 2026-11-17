Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897288;
	b=yhMZWEoCEBuS2pS89L81fDhob4rwH8Ytz3jt2n7TlXcrG6Mf1Ebfi8rfY3ULPj3Cyq5I
	 eFy2anMgd59bDqKjpt3dTHVMibvA0P/qVgzx0oMRwwMDEndXVCpsGObjjcRE2RkDGAyLN
	 R1RAI5WH8vId+NHyFwhH1463pSLfqHKKpmxwUGBEtk7db/92kH6oaAhLAcqe3SdlxUGrV
	 P57CF6il4A9izWYqbuX/a2Iv11qE1gtsoaNYV9Wnx4dlxzpTBDkllAsIVTB0NiajmE3Fh
	 BJ9bA/TUUKNjIt08vBfkai6zlT0121nKvlJ/PqLTuqB0X2zFi/JRvzkrQP6nE1tMF8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897288;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=;
	b=hjyrhksBsXKH+frEZMDuP1eu5LwoDiPsIjHRjum+2rfJA2rUNPKOdbhqPF4o6mOCFFYm
	 WubFnKQgmWFx19xB9S0nfdgqDavcusk6RiYPwX+XscD+mUIasQWZ8oaeQwrJ8gC28p/Xl
	 VyJ2vfYPhiMItm7kKPkXEduKd+hjcmdLzgbTOBcswGSTZ0D5t8A8s16Sm677kd2Cij1iu
	 yxkaLJIq71i1pqnsVbiA/yY6ScGbj/xa1Mpl4S82qDIr8PHKgKPV+11IqvRkBwiLu9smT
	 MMZjWFpvSBNFGPdDjG4wIZa2kaGRjAVeYpzPrTy36RAomkJjNsrFpoDGHfUKfiIQgqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hplfNUYI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g0q0nvYp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E263606A31C
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E263606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hplfNUYI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g0q0nvYp
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH44M9w1699694
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=; b=hplfNUYIrkS5lLFO
	ikP7yKjU66vTaAm9iesw1Yn8ux1tqMu+ZSv9YcI43bs+11n6DH/h7euySh5E3MPr
	kyPzPP1WdIqOJTuFuUEVAnlzODtvdEn6tLeBjPlqwzf7Ha+Vr8qKhMNjARJPOWcc
	qmKxyTtTYh1ljlXBl7fxqr0cEJz8mjs7VuQAm2pOm3NatvpqAIutMOkBzTmvfIyz
	QFsM4VjfsA9W3e4HFCG4bZAeiu9TY49vUb+HLl+PdxKIb7ZsgTM9Yg7biagtVLMY
	JJVXwxpthZfjZRi3dxJ7JI/oJtK7BRqkZHR2M2Pgjn5jodvWIenjz07fj2kMYiBE
	LvqjcQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjugey5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:34:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb86c39250so2237954a12.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 22:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897285; x=1795502085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=;
        b=g0q0nvYpgkL78uUZCkBR7CmRT77W/W0ugpCjBAs3P7JIFTaS9QM2LOT60Wu7gKArUt
         NtFOukgSFMKqRy4H1gVhpZj0sx7smCGa9W2AXZYZsgMjYWZuTKfAXsh85Dl73sMsmO7S
         0F/v+XYCBMATDrekO0Tk6+cjHYocS6rWKQp6+1FPOvYLXTLkEHEB7Fd0rqrFwUseIx6X
         c/8NY5qU0TqJhooHmMGeVg+DdJzUBWki5jviRC3TIhX7/S1cJFyWodMQjPSGfSboYbn6
         oIS55HIJc2/Zts6WTq+zbxu5rRtVtBQlQKSjRsvtB2p1H+AvXMD4MYiTZRIZ7UOirha1
         IsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897285; x=1795502085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=;
        b=MYG8DAQY4uRe63X3gJv3eupYSzo8F0If98JhZ6S2AeW0zXnkA1ZCkiRE7jmRt83Gif
         /Go/s2pHhUgcv7RUZOC6eUVMh9Z+FNChXZJ/x3tQGg9syy6gGrPqROnzDoiy3mFAKhrO
         /NTurIbA+vMA6lFvW3CnhsWCp09/Ur508iY1i08coasmFIwlXdl3S7HXcjn6YLk67Hb0
         cF+wASk1rN1o+Y/MBtFZ3xUqtmAyCkiMPcouAv6ScdR12L/ewiB2Cmu6QXSOJauQUDjb
         9hFmtY+PKx1J3vFXaOBCtwOfMWpNdDU7ihANlx+aeNNt82brouvUVKkTVgetXz/nF3Ur
         uaAw==
X-Forwarded-Encrypted: i=1; AL+hErE5H79b4EwTZHSlioXXLEA/bmUVt/HHNb5p/8WYmwRqq3W37NnTaEKEl3FFF6P+p6jHE6IzO4BOXSxmlA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+loNADMe5bPyejvakOJ9tzj7zDXMyQNyVYdhVSgek+zIIq5I9m
	gzZIHZZZbFwFiKuePs2v8zmxJaIWp7REXhlpcWQMJIOwmJhSa9aiXG8+yLxOnlz28Q8jKsdjaQ2
	aCaMf9s1Lsf0q5VlCIcPBZvewgpas/qV+cYtXDGDxTmgoJLAxSJgF8/wUHi90zQZRvA==
X-Gm-Gg: AYBFou2ihNqn3GEtQDjZz+WkxM2YAhjf9ZvZnkYUv5+tAT0DawjrlKQAYsF3nwiuaz9
	dYqmiS2UY5JVJ37cVuaUahyZvWUOaxlZP/P2FqX35MpGT0dOXbvH3qCQECY6VyVPPgkyjap2duZ
	y3LBgJZQL0/oH+Sgeq3tiu7ys8C+dBPB56mzl8KGo5mfbbvmjZjMQYTPZxmYoEldwjDtBWCfmWe
	82j9oID6NkcGi9HiDkrnEJKgyN/yWNVC/NUuH5MTj8YO41O0H9Hpmb4dXnE62EeI4ouW9wFIWGz
	sMZrYLYSkFilDKtW7aGSuDiZJgxGGcL22vl7UxhTBxk9Y/lYrATPQj3FJOzlhTR2LfkwvAmDft5
	c0HaLN8uklAtLhJauS8JJ4gOEYyz4az0MtYfAFVHeIsO/uBSvnGu716yNkuwRUoQUL8gPjmEJHP
	9yXbeOd8QdeHHUdUqC4mWfRvEDdUlkwpWJtrDV2PMzPKgWVQV6
X-Received: by 2002:a05:6a20:2591:b0:3e2:86b6:9bed with SMTP id adf61e73a8af0-3f7a81ba72amr12380193637.57.1794897285513;
        Mon, 16 Nov 2026 22:34:45 -0800 (PST)
X-Received: by 2002:a05:6a20:2591:b0:3e2:86b6:9bed with SMTP id adf61e73a8af0-3f7a81ba72amr12380168637.57.1794897285029;
        Mon, 16 Nov 2026 22:34:45 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:44 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:30 +0800
Subject: [PATCH v3 1/5] dt-bindings: media: qcom,sm8550-iris: Document
 Eliza IRIS accelerator
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
Message-Id: <20261117-add_iris_for_eliza-v3-1-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=1458;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=ERwzmO8/pMXME2fZDOM0QI60W9iJpQBHJoJKsOsmInk=;
 b=QeYf3Y9llgzNBkc11s6iVXzSN2QcXuqIUobXrnbe8UUkztWuA92wv1c2DE4TppWmTfDYWJFak
 xkN0cNUbYisBG1ws1TRrhH5x/9E/iGAZTypg8jhwGFBgX1JzFTTosX5
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX648tkOTJ2shV
 ub5BtmrPpaFJkXAWEfpTbC5HUid7hjxW0q35/FaEL6oM0FXi+kyida9sSzRIWoMmk+iCGRDPeY4
 aG8KHEP0BdZJqvxi5TGUmMczqlwm9DYf4+Jz3+Uh3LawmiMftBXTlpmVxgYWK6u1/0/+sUxqCD5
 8NpbXBVVDOLQcI+xkXQ9V0iwoglY4bquVTjiEtSj9aBaa6/TnVjfKu66M/KhMTjiTwoYPH6BmP7
 g4G+YWY7BW1Ib/Sv5Fys2jUKInvncpMvKtnP/mRUCxuWSbehfWw917lahfBzlQM9kw8tojAT+fF
 Z1VnRdr42Iz6sqspdA7bT6J7DbLjTqYeD/DXjgOWmJvjqWCHpFFFLhzndI891awQab+iMlhqqwR
 akO3VSIydKOTczvsTiPhGUPjF+Ly++Fn6AOhAuFFwpzf8u7aunYfMSkK+wFK7Prcy7UWN8e6TOs
 1FUpblQ0f6ASbHRX/QA==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afbf586 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Sm_iIEVIus1u_0tAx5AA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 3dXMuBUYOqBLOAmXa-n-XKnNmrGyx64O
X-Proofpoint-GUID: 3dXMuBUYOqBLOAmXa-n-XKnNmrGyx64O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX0qG7PzULcCOk
 Wg/KXAYc7322fDcUv8K9IO+NNy+zIsDhAIlQL7zSHDzWHlmIuoXmn9Gh2DyQ2TIoxT83WA7/f1s
 chGUs3qVx0bnw48eYOh9ekiB3HOIS8c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170025

Add the qcom,eliza-iris compatible for the IRIS video decoder/encoder
accelerator found on the Eliza platform.

Eliza belongs to the same IRIS v3 family as SM8550 and SM8650, and uses
VPU3.3 with an SM8650-compatible clock and reset configuration. Like
SM8650, it requires the bus, xo, and core resets, so include it in the
existing allOf constraint that enforces resets minItems: 3.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..e06f2d844bd2614f6bc5237e3a246056daf28821 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,x1e80100-iris
           - const: qcom,sm8550-iris
       - enum:
+          - qcom,eliza-iris
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
@@ -106,6 +107,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,eliza-iris
             - qcom,sm8650-iris
     then:
       properties:

-- 
2.43.0

