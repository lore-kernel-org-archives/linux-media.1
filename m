Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93C3474262
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984311; cv=none; b=oj49LyWf2sYPa4evWp6+qVxvdKWUjCGlldzXjtvwnb22lFw6thNc+wfGUGpJi0FrqulGud6a40zLBKrJWUfueGpTtcPZvoRLXyOAt/Cw2ZnfqRZrrLeZOuRp1rFvAPH+hLt1hn+6xniyOWZm5amgR3FmqwGzd0zfqoAYUDRw3l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984311; c=relaxed/simple;
	bh=6W43BvwHA+IpXlwv8kwXjiUIJU+UUkDiV1MxQJgJM0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ap4hJ+Nz58hK5BTd4WKaGd1LoJu3OM/mDsoCwwTtbQlkQDjthRG9W+nHuCNv3aTn035+Y7MZ7+4pOe6UNGYmzCrsnh9UQ+rjmxJENcPQQc2hUbnYTAdnqkjp6/PQqrp+Slal09DzMp+kot06bsVTN2WUkfkR+uQnqDzP9ypycgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZFxzqNA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZuAyVoE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZFxzqNA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZuAyVoE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7APFU371183
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 09:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZD7N4GXTK2zYEpmtHC2Rk/NL8WMsqxYaJ1JMqgjSI24=; b=hZFxzqNAS2OI3CBO
	4PrpV/6UiPfsP50NJXrowOB6oZjYnW0GtfwA6FRwgiPWkVgJ2U6WIWeqxAXjhlgD
	I37Tceeyx9EDLJ0Hf6OHzyJa3WN31VMNEYm3iU1rtNr9Rh8H+QwKvvG6z+W3t2F/
	3Wy4I5p1rqpVzOFQcohhpMXa48KSGPkn6MnPPaq6A/fiCx4RB/BNqfyKoBe8vrDs
	yBxrDxr1hERsIXfCj0i2Njs/Mk7GSpHVQklUr3Si0B0gHg7PxAX417Tp3A2FCRqS
	m5cZDme16eu8z4rzBc3Gu+adA3wk5DBhHVuHRRShMT2IvTX05XFbOB9EqDmBh/4k
	uJSNGg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5h73y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 09:51:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd667770efso38556175ad.0
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 02:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984308; x=1790589108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZD7N4GXTK2zYEpmtHC2Rk/NL8WMsqxYaJ1JMqgjSI24=;
        b=YZuAyVoExgH+f24i1gmd+8eGn5ReIumN+thKsRkjTQG82vmHGvd5+UKJilIKmpupt+
         Y+k7/PMskc1vidTDqhP5lRe8c4y+4BJ1FyqD1FodOQK+THMZoXpY+Mey4r5HI1UDwL1k
         3oGbKVR3sUWDtmTGH/fXyF7oQSX+8GxxdL2vRLo/DbUvZ0/JiSvsUMXD06uuz8s1eg5/
         qdQxchOppk8KjP3Zg+DusfEISqS8ov8fJd+tysTD99pDeVzvXtGvBHzeWXHusMEy1SWV
         oaZ33t6oXlbTZ+I+390OqbR1K+/Pj/XASs/tR+MFY+ehnnbTOOvyGEwd7mihRNL5Eizm
         XRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984308; x=1790589108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZD7N4GXTK2zYEpmtHC2Rk/NL8WMsqxYaJ1JMqgjSI24=;
        b=rOEhZ2f7htX9plhptd3LCPiTaCoLYY/zDpjUOb40V1zykGAn4K5sjHEAqGGa7B1Z7m
         Tq7C2VwNcnigdl0V6Uakbv5zLXvj2tZdXdwbOjpuwE71NhYbY1E1rGk7kARnMPr8LwOP
         jMe+5gEcochj2+/vqoZEgY7vO9MLW7ZPID6reXmii3w6IQjIQPUeLCrSlCeYBE+lY9HI
         VZcCxnqlkbmyr+uMYM5vmli5H/qBX0+BiM7T6RwSHYKQnHE/6BGSMo2iJm8x+1JOS9Go
         esqH6TmlzSvobsrYc2AsK5BcQp1uCOa8B1aakruF+FfO5tO0m+7zWej43aTOnFORfcaM
         rB0g==
X-Forwarded-Encrypted: i=1; AKwUvBx+1P1o8hUjonGAT9XwLFvjTpnBzdCb8MPFgZwfUAwkzPtMaWte8u5FiUNSJ3b3qA9FqjH6+pemqMgqVg==@vger.kernel.org
X-Gm-Message-State: AFuF++m/WbHU/nbL78fZ44n9KJEoZ4qykAGkaoDSUJgOx7vTgmnNxAGz
	SCd7PZjvKnOFKZlKiM4etENUpn98wGLMjSbBxhl5p4PpDga0AESteeTrqP8dmLKkwPpuMnvRX9F
	xe64mQMKvzsLvS2WvyJ2Wza73+NJXxTwAhq0SY1L95ySSyn8pL3N4aLsByzoK0CTaaA==
X-Gm-Gg: AYBFou1fL7BbbwBcObud5kBhAcPHQm2UgKtZ7rdg8C3oRHAJH7ikUiMlUs8wqXaHSsY
	e3xDBCwmrj+PuRwKLHU7S0WJh542xCyyTqRN4UCss/wW5lV9bFQNQqr2W1hcAnsAptqScKV7gwr
	sVkdyIysiCQ0jA/WTQOyvucJ25ogoCuek7nni6Y2Uu0Q0veoQSjlwlKUerVR4qWqnaOuDartkDV
	Qk+ZSj4HjIhCq4Efxu3kS7ZVVxejdjgNVtDKd+mukOYvopyJmBkV+koedjKXiZexLAlSBbxv7re
	pghbNqehW6Au8d2D3FE71zeWxB+Yv3S5yIYflLKvTTrwQmoqPNfUOb1sUXT3yAqp970gWgkItoS
	AKSqQkqGA21uj6E4cb6+UXqemxZ/JC5oafd5iEEw0ajatRv1+Vk0FZXgor1dyElrKtMHO9lbRyg
	==
X-Received: by 2002:a17:903:3b90:b0:2dd:c100:251c with SMTP id d9443c01a7336-2ddc1002582mr70284345ad.37.1789984307782;
        Mon, 21 Sep 2026 02:51:47 -0700 (PDT)
X-Received: by 2002:a17:903:3b90:b0:2dd:c100:251c with SMTP id d9443c01a7336-2ddc1002582mr70284105ad.37.1789984307347;
        Mon, 21 Sep 2026 02:51:47 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178889dsm30523095ad.18.2026.09.21.02.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:51:46 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:51:34 +0800
Subject: [PATCH v2 1/5] dt-bindings: media: qcom,sm8550-iris: Document
 Eliza IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-add_iris_for_eliza-v2-1-5fe7be8c0230@oss.qualcomm.com>
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984298; l=1458;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=6W43BvwHA+IpXlwv8kwXjiUIJU+UUkDiV1MxQJgJM0k=;
 b=03mrSIYjGb74v0043xZdV5dHfE5NpPSOhNciwxYPzpcJQhYawtO7DPqcZ9zptKDmbSTfHMUfv
 loUzOPYeZK9AQwFwaD0aPvJ/fdsh5yBlo3IP6KhNuAKpRy5veofYOoQ
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab0fe34 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Sm_iIEVIus1u_0tAx5AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 7ZA0-0kmMyrhvIZfTvPcK6AvPhYcv3-C
X-Proofpoint-ORIG-GUID: 7ZA0-0kmMyrhvIZfTvPcK6AvPhYcv3-C
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX/fEis7Xot56L
 QhYN+4dkPIpr3owc5mZqPpPvbDO/BSKG11YXdLG8g9R2kjY1gvakz3nz4+OrrqjuqWBXRTJaxFi
 kHlt09euRJS6aY9tJEAh+YPaMyXx1fs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX0/6lOuZDATTj
 4HpTfAaBmygy4l9B1CyyalZV4s4VH1j1DfLKSUlm02VJ8YP3N/xvYXsK3insn50dfYuz69WtAoX
 yTavo8nNMBC3LzuiJQ2orsI/3Kxq9xZuRwsvjrHV3lFwOtz+2NtC65NmuJk4u9yk08plpNxgtzk
 8SGe7Q7iyVeXCXZ2g+m1ARf0sSgZ+Fmy+ZxzlDPs8f4GtCJ37iHC82TFJcMM2mHBZkv3d6i+JRp
 0Ex7fwJdLVYOk4mjayvPCEiSN4GnHpasDTc+3ezKiedd9aKt/FmTXo36k1QVxBSbfV2Q7dCRLe+
 cI5nj3L5ROxOx42FqtDCQMdgvJlEbxQ+0iDPwtJcwAzKcFONBRTi6/AeDssS/fUg39cq4jzuL1b
 G+LmI1p3JU3nrTGqUca7WZ9He90QllyHPI3VYsZn9OyFVl3Y9mRUAh5InhC+ugUQIsPj7Nfq/Fk
 Q+sQ3yZP54hE/odjGMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210141

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
index 6ee9d23554cffb30c92017ef99de15c2493455ac..b97f50bf16f6634bef0e0dc598f9268a654c75d5 100644
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

