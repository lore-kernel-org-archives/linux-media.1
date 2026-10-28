Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193860;
	b=K2BpAMYDZNi+9KQdGJLrMWwqIo65gP7rRDVsax8lRiqIytbyOGgqVKWjPHIzp8/gkXpk
	 2/9eVlm3MCrhRuZzhNNz5f7qv2eL1zT4emSvme7BTe1rxj5WbhQUW6KSpTOXwW0K+FIFz
	 Afgw6G+VaRwh3Pa5Q16fm18HGL4wYGS4D/saqbKvRc29kbhal88/55pItJzWid7WS4hjM
	 bltq0ZPHXYwo+0nZbyy48BtiMOh4eXWRWZgHyOhci0Xii24UyBjV4sehmFgJo1N7pk1EY
	 vlN1s4ur5eoPj30DY/X2cK7/d9dSX5W1wtSuP3ggqdlk1VTD8oK/V8KQpncRAWOM9qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m0cdH61+/9e1ojUoxbXI507X1lJnFk5xGFSGwC7PDes=;
	b=L7Jk0wUO1DkyeHF5uIvzeQxKyb5VQ02Y07Ak1Vef1fOouqBP6MbYoFHg8h2cExiKTfxJ
	 E+/35e/CU9IOZF1CvEtGK8mElO+RNwmleagq2274tIDy5c5dTtqiCJHH91ReCGZUaPzAg
	 Cqz4BW6LLN04lhrJB0rXdXdWfmpF5Yoo8ehBfi+vvdcTlpJKvyOsPt9CMLeyB8xWXEd1y
	 3vmBX63u3wvznIc0uwo+QeDr/laoODO7Dy3fbj+srSsiOU20S6TcbxNORMGcOFRVHr8IQ
	 D+l791+Vlh2+XdDsGrr9D7QvjedEnOsmKHIgbYzca9jvcnXqLVwOmPGQ3RNF4EXUnKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VOmLJ9G2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LSFS4DT5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FCC606A331
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0FCC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VOmLJ9G2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LSFS4DT5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2b82082599
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m0cdH61+/9e
	1ojUoxbXI507X1lJnFk5xGFSGwC7PDes=; b=VOmLJ9G2y2Q+z0HpF37VDETeYWd
	zra3YTf8Kep+rGb4MYr13sN0kWEnD9Kw4Ep3hMleZNb6PviCVrnGVjV9epYWg+OT
	cufN8xRWlvYoHJdQfbJUA8hO2TINFA84T36SdQ6kRWLsjIa8OqDsOvqZf5HOVCb8
	0Ljy+xlpRcyZwaa5Wx6tjbLUYlrAVDnlBkoTYATLEAM6NH17wgoqodjh41a854Bj
	jeWKlmNL59uZg8jcZt7sfesT4mgnl7xd8e0iA9BZ4XzMqGbpAAVvWwBWvPnmsp5r
	Jo4PCLI83Ntc7mHxCANMEusM1cuWt0nkG0H+lzhHlgOyE7vIk6sgJA3nAog==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpv5r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7d79203cso14687106d6.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 06:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193858; x=1793798658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m0cdH61+/9e1ojUoxbXI507X1lJnFk5xGFSGwC7PDes=;
        b=LSFS4DT5nR5tCiYFRwWqWTYlOB4nC3X9BXr8WyQfmfKs08AeKDCqciDSOabX4XKenH
         7psKyJm2uoVvQk/SL3nnp1enP82tdSLyguh/2L0pd9tQd/cl4Ar4qYBj2WmMStFm6o24
         RcG64G42/A+7tZe28JaCvz5An3DRLgjSKNuBliKOBN6Dhi4uVuQiy6poAEnKNesF3t5n
         ip79xy/aS0E583JI1Zj/y4x6/7pjZ3mHRWOqB2mijoxJzbH8jHMi8t695w3DUkYoCEOr
         15geUV3SkEZvXx5CaIkbWXbACliQ0rRTquoTsMPgPjA+MxiXJlL4LQ4dUwFOzFK2I2wv
         2cxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193858; x=1793798658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m0cdH61+/9e1ojUoxbXI507X1lJnFk5xGFSGwC7PDes=;
        b=TaY8yBzeKCBKulqwX2nw1/BuE/Jt2Sgk/Yvvd0eGuXABIIdKNbeYAhUFB8r6TUKNB1
         b9X7qhxlxr5tX/g4H9dSO4PzNxuzshYgTFor2bFDJuIrP3cbfxrHqqV/ipNJf5kPXBzb
         nG0AFo6rp0jXq/K67eBavLVJWmdo3pHCC0rE5Dh1Zm1ZarAutVL6ez35oGyuRi+rYufh
         BNvtInxaQmkXIlV1uGz9NaFE0BhVvVVNaoPkInBNA1em8pcUirjbG8vpPDKWmklglrKy
         UQE41XEg7+WCyiFAM0mO0+R/EBOTX5tvMOKi1aRbhtT6M9QJRVUGsw2nPehgQr2BybZd
         0LbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwU0noKdSOUGatE/xUXtZSy58TcaapJ96TZ7d0Ld79X1v73cenENpIHlzJoc1bp81oHxzlbaX5U+LML/Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvs1+PMS87l5OMsthI9uzVRRhIG6zjtTmk5T6t8pLljjxAlAke
	Y3dtwTR2PjHi6zUr6MZbCn5soWlqp4it93TYQoUO/E80eSN5BjtG83leWWaBdk9Rl+rHsP2BpMW
	571ER5vG3zshQ+P0Gcbvo/BWcCWyHTa2LmN5vMNYULHrGRXaGs15IfkTm0zS2wFKZ2w==
X-Gm-Gg: AYBFou3ga/ExRWPm4Dnn8khu/Nw0enoT//Qd2Cfk/iaV2hO/sMHecdC04uEk2cMpqPZ
	aQcnA0fmdeBfQfGwTErQDugYm/b0H+7TLmjIKBZtm3U3moQB7/ixKVDZuPF9cIu094nud9W+BvT
	1fVBU9hjXe7hNMD0DwfHkbFXP5hutV0mLLxz9DKBUqd86u+UwR6aPZYyVpeQn9N7+5jjdJkzaSU
	NeFRo9HPF3Cob4a1xqxhYJS/WRsdHKn8F+dFm3dNrEriPCwi4NLZnGZFIRZii1MHs/Cd29suW+1
	uxxYRbpRzVznwGKmjpHcHQtIDtBes825lWPyEpD1Z9/0YLby53NvNv2xs7rc7D1TRY6VZumoSmv
	kha6hI8WoA5rDAbcCn3i7mA3eBJ/cmdsJFPiZ5oNyajhtR5g9h5gpYKVFifPB2I08P4uG1yNatw
	==
X-Received: by 2002:a05:620a:2688:b0:93f:353c:6bed with SMTP id af79cd13be357-94408a69494mr339803485a.20.1793193857905;
        Wed, 28 Oct 2026 06:24:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:93f:353c:6bed with SMTP id af79cd13be357-94408a69494mr339796785a.20.1793193857125;
        Wed, 28 Oct 2026 06:24:17 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:13 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] media: qcom: camss: share VFE clock sources by the highest rate
Date: Wed, 28 Oct 2026 15:24:01 +0200
Message-Id: <20261028132403.3505037-5-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfXxlJhCthjb6fY
 0PwXj4HIv2BOjiI4y6f9SlsOldFwAvdIP2OEjtbvpJXe4O9MfZgl0CLMaL8Ev1e8+35TYfVq9hx
 9z/ssi3HuHHSyZHkOgF5AqpErXRO+gdNOuW1sVCAaQ+HhUZk7PsgWoRk0cV4TFOKNSBrLwp6R/w
 IAZvJ0RQU/Y7rW1Mq2nR/oomIB40xITf1HFzryvtYAQ5uiZvG0V7ezdz0tRTHrtlRJoHz2EPfbj
 eoA41FejfqJxclmSox032TsCYIkVruVS3XYa6uaS4AE/XgpdsDe78Lg6ab1X2vkrItFHu8FFYoN
 XGs9WYbAaGhAOWMUmWD9OFuNC51yWswXzKIj2Yyy3eyr8CaEYkBOtR6//Bwrx9Nwn9ToKznYHEh
 Kje/xxrKFtBNGzG4D8Tlg0+GhOjbbsh5i1JE0LomqPQrkY+lYJdkHZdfCFI46xtZ0JQ9vD6SZ8D
 HObREhtSK2u3LCsQwOg==
X-Proofpoint-ORIG-GUID: f37KP8-OaSTyFDcKmlP2M_nSwdQ2IVPl
X-Proofpoint-GUID: f37KP8-OaSTyFDcKmlP2M_nSwdQ2IVPl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX9V07VpNm/jJ+
 tyI2CkoTq2Rx1L4PIsOO/d/3jj+CcklRGFGFypBJMBBzj2qa7MQjA7f066f421PP5LWYKwzdVp6
 u5+Pe9jGzibjsfK1fJ/zu17FiYgUDM4=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1f783 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=IrtjSiDjB1mfS8sH3h0A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280053

Clocks of different VFEs can be fed by one clock source, and each VFE
sets such a source to the rate it needs. A VFE started later at a lower
rate then lowers the source under a VFE that is still running.

For example, on SM8250 the two VFE Lite share one core clock source,
which the VFE sets to 400 or 480 MHz from the pixel rate. With VFE Lite
0 streaming the CSID test pattern at 480 MHz, starting an imx577 stream
on VFE Lite 1 sets the shared source to 400 MHz under the running VFE
Lite 0.

Request the VFE clock rates as minimums with clk_set_rate_range(), so
that a shared clock runs at the highest minimum of its running VFEs.
On power off the VFE drops its minimum and sets the clock to its lowest
listed rate within the remaining minimums.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
Changes in v4:
- Use clk_set_rate_range() on all SoCs, drop the vfe_clock_ranges flag
  (Loic Poulain, Bryan O'Donoghue)
- Add Suggested-by (Bryan O'Donoghue)

 drivers/media/platform/qcom/camss/camss-vfe.c | 39 +++++++++++++++++--
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index bcc2c1929af1..46674bc30e6a 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1037,7 +1037,7 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 				return -EINVAL;
 			}
 
-			ret = clk_set_rate(clock->clk, rate);
+			ret = clk_set_rate_range(clock->clk, clock->freq[j], ULONG_MAX);
 			if (ret < 0) {
 				dev_err(dev, "clk set rate failed: %d\n", ret);
 				return ret;
@@ -1088,6 +1088,34 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 	return 0;
 }
 
+/*
+ * vfe_release_clock_rates - Release the minimum clock rates of VFE module
+ * @vfe: VFE device
+ *
+ * Drop the minimum rate requested by the VFE from each of its clocks and set
+ * the clock to its lowest level, or to the highest minimum rate still
+ * requested by the other users of the clock.
+ */
+static void vfe_release_clock_rates(struct vfe_device *vfe)
+{
+	int i;
+
+	for (i = 0; i < vfe->nclocks; i++) {
+		struct camss_clock *clock = &vfe->clock[i];
+		long rate;
+
+		if (!vfe_match_clock_names(vfe, clock) || !vfe_check_clock_levels(clock))
+			continue;
+
+		clk_drop_range(clock->clk);
+
+		/* Round first, so that the rate respects the other users' ranges */
+		rate = clk_round_rate(clock->clk, clock->freq[0]);
+		if (rate > 0)
+			clk_set_rate(clock->clk, rate);
+	}
+}
+
 /*
  * vfe_get - Power up and reset VFE module
  * @vfe: VFE Device
@@ -1111,12 +1139,12 @@ int vfe_get(struct vfe_device *vfe)
 
 		ret = vfe_set_clock_rates(vfe);
 		if (ret < 0)
-			goto error_pm_runtime_get;
+			goto error_release_rates;
 
 		ret = camss_enable_clocks(vfe->nclocks, vfe->clock,
 					  vfe->camss->dev);
 		if (ret < 0)
-			goto error_pm_runtime_get;
+			goto error_release_rates;
 
 		ret = vfe_reset(vfe);
 		if (ret < 0)
@@ -1141,7 +1169,9 @@ int vfe_get(struct vfe_device *vfe)
 error_reset:
 	camss_disable_clocks(vfe->nclocks, vfe->clock);
 
-error_pm_runtime_get:
+error_release_rates:
+	vfe_release_clock_rates(vfe);
+
 	pm_runtime_put_sync(vfe->camss->dev);
 error_domain_off:
 	vfe->res->hw_ops->pm_domain_off(vfe);
@@ -1169,6 +1199,7 @@ void vfe_put(struct vfe_device *vfe)
 			vfe->res->hw_ops->vfe_halt(vfe);
 		}
 		camss_disable_clocks(vfe->nclocks, vfe->clock);
+		vfe_release_clock_rates(vfe);
 		pm_runtime_put_sync(vfe->camss->dev);
 		vfe->res->hw_ops->pm_domain_off(vfe);
 	}
-- 
2.34.1

