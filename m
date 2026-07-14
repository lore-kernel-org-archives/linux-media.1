Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC05F3CF96B
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784052472; cv=none; b=cDdiCDhjLTPIj+XJM7vPcEG/YwJbunP1p21KsPcCPFYGeqCHsXjBMKzzpGfI9w6+f8vo8nYj4y+Q6uaq5BB4YVqKMxSE3PL9T/ektjhouqtobjFn995WBmJXHhZYMeklUA2oJn2SgemksuuMy2mE7sO7Ds7peG0dbTuumSznKtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784052472; c=relaxed/simple;
	bh=zX8o5jSDSZ8QGrnvKEYDJCepjTiZZwGx2V+Rc+oVLvg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L7Z6Qt6SPtn1nHI7PXLCvu6TFSOvSoG5br1wAHuTzYjZorvRejd5P7BGuR6N4qbq4+/aIscCfsXmmJRl27xoasxFmEENnHc2pNuyoYYh1YhA5Q42pSG6gkItmhZvERVw4GDgPFYv0c1jP4bAU2FQMLlHK5Ngfr98lblorMNL3YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UytwnRh6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OzZWnpW4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UytwnRh6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OzZWnpW4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EHAmFw1177154
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 18:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2cKztgpSNjz3WKUCSrKkFj0FRV10LmHOvE5zYzFACW8=; b=UytwnRh6KqgcC0lX
	KVGpRsB9qhja5Pg/BP9NgoFaytz8mPapShHcJlC0SRunomtbZiZpaD4IHreOwo9o
	TX0/eecIZhw3bn/YXX03e4wgmUtBTnoanopd8p7ypsq3nVvGwC4I1FVAUK+5kGe8
	QDZEebQ/R31Om/+TnVNu6vaw5sQqfIa/HM6vsR3jU6t6FEZgVr9fqHkekbK7XQqA
	ZPtNErVYUgcUyekFBlev86QhT//iQuEz9ppHr2mZqmTnlamyDYfFxwKHUHB6G7vV
	4JWYFP0NT3idKhWnscKE12eqlOOud7vW2C9D0WCrFIjpjZB3Lj5bq2FxiuMD0rQF
	3WuzFA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9kr6mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 18:07:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92aea0d801dso223284285a.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 11:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784052469; x=1784657269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2cKztgpSNjz3WKUCSrKkFj0FRV10LmHOvE5zYzFACW8=;
        b=OzZWnpW4qrAe7FjP5WtqThL53GLlAiKOmzeonOh3qNpkgvpRG02/GChQ47rjG70hQU
         8Txw9Het22oRevdnj7SW4k6180IIDkf9vBVxfdZ/A+v7ZW+MW90v1Kp5XM/rcGqJctBc
         Adr6NALEk435xP2BtxpK/B6+PQ3rAIkTbY1tl/4xC/C/K932zx71qiDbSl/MDL+dtPvb
         ntL9mYvZuShdCiiEs2z/fw3QnXh6c2wmJTBb/whuIgxQqXXSBlDKx8mjLPGfuUH+to6V
         SV/FbJZoCd/amV8ZrCEHhDuHb6fNy+voh0L+ZW4R2fZdNOmRMJekJUm6zOcV1V57v4lP
         4kXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052469; x=1784657269;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2cKztgpSNjz3WKUCSrKkFj0FRV10LmHOvE5zYzFACW8=;
        b=eAe2u/Qgqp8wptp6f/fericPx/IU0qMv2MpgQ+IzTKneKxbPbL7mTvxAAfF3QQSMbY
         tkWzeI0gppquygWRI7Eg2C8Y5Djn5+I4hh+Pgh+uCWYVDUgvzAGWYqS8baLo8cCYyvQF
         7s5lJeRQArY99v1FkGORSXzaKp37XBwCBusQMuLhbskSn9kUETLHzTwQJtBzwn0E40Wi
         aIhgIUY/Gi2UDfmr5khn+zxSZ1AF6BzCL/l4Nw+dMLmIvSbsiLOd2Xrh9ZAJ0OUxbyEJ
         a9Jvw7yQUtl3023QSq0n2Xad+PHfM0MIgNb9TaAco668fCJvps4bqxNKCkwou0ygW4TS
         OnEg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0oScF3sVwQWNDj1JuWGxBcI8YDpoCfKHnIe56ZgCgQnpD6BHmWieKcq0+KUgKGPqrrQjIohZ+FQd7tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBbFdGXvzBNm2qhD69OUcPSU4/CXb1wWoWntPrgw+xtKD99zds
	/Q2dgrE3LMzYcvkwZpEfjix0mMbdPWDzKx/thTQ91kMuJ5ALHt/85xN7WJ+UmL6MCTRmLamNLFU
	U5zXyKtOkUl5JVYr5r28uESCE89NI8hf7hytvDRPQHCFNUXtU9hcxWA0ypA7u5HcD/g==
X-Gm-Gg: AfdE7ckx4y1WwFt4Gd2cTx1cNxqE3sncKARpEvQW2wbEQGFa5fhOJBb60IP5rYC/bXL
	FclaxW7j3QSl0AIgGvIy/nFYku7DYdu/ichEluUBmFlsKY8IqpLnvLqiVW1VyXX1JRfqSaQ+yyv
	WQ1iq0a7jcESTZ8U3u5uHHI/ZsGSfEr7CM3ksSi/OBM/y15umCIrOFBXRGjyP5Psl4U98cCn5Qd
	u6PMoqcHRgWkT27QcYyeiclDUDguTqv3kOK3FAzVI057OdjiUhR24wnYC3VqngEQX/Fxj47GEEY
	rHcrfjP98qrmM0daztT+YaWtLVW/a8dPbwnxbB9QkJ/7X+g95kMpj9M7DLqkfrGjf7ahaUGaJgC
	rziUXiByli/Rj6cnpzkkRj3BdnArKljsWzkvmnisRhxxq/miS8KyRoMzrpyzZgPGWFw==
X-Received: by 2002:a05:620a:2601:b0:92e:e314:c9ca with SMTP id af79cd13be357-92ef2c1fa96mr1459204385a.52.1784052468816;
        Tue, 14 Jul 2026 11:07:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2601:b0:92e:e314:c9ca with SMTP id af79cd13be357-92ef2c1fa96mr1459196685a.52.1784052468350;
        Tue, 14 Jul 2026 11:07:48 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930759c63fbsm465448885a.22.2026.07.14.11.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:07:47 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
In-Reply-To: <20260702115835.167602-1-sumit.garg@kernel.org>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
Subject: Re: (subset) [PATCH v9 00/14] firmware: qcom: Add OP-TEE PAS
 service support
Message-Id: <178405246411.4102418.8979771009872296240.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:07:44 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a567af5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=50BX1_4M625rkW4sIQwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: YHKdUhYB80iYb194zc-nClK8Twtqt2h3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE4NyBTYWx0ZWRfX7Jf0VldZX6yZ
 OHfhNZHqKyT7HnKKo/IBgDOZDrAYNSxkDQHg0HRe3K8SgH+XqGPusOwhEVwlWsO8+IvBEEBhR+S
 Rb95mBIWfDgHgRYGWSCwe47p1cw1hHE=
X-Proofpoint-GUID: YHKdUhYB80iYb194zc-nClK8Twtqt2h3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE4NyBTYWx0ZWRfX/cbsALMz+Rrs
 +m2OQSZzKS7dRfL84/f452wMi9+aPGB35qaDWpQto3+AIjH60kMSSsh9JxkqYSFSUPHd/xnviHk
 wkK7WlKWPJBZrEyOK6YN7KJK7jnsetjib9cFuz/ZBwI7RUQeS9MnOfs99OsavO/aKNWirbnIkuU
 o+pdLnbddhAcDFoChWdl5/dvt5qmJjFJzb744et13BxGb2oc/QEaENP8zKIPPGfzjzqwaMfMvLm
 R4CZIRNWHp7+sgm4hMzcCtmyjLj8O5Na+1lnuGRmQ+SPa13EcFKB1GYkf+RSSRHcyTnzQxKB8Vv
 tFyWgraHVdETw8kYLByUPQi/zaDPKyqGYxm2zCf8LmDHMtXEM1Dvih/YJhFO3KZ3n9vj6ezyiIK
 YrtbHrehEtOOe6J88D38D4osTTR7sfw+7mbOpH+fTJ4sEtrf1Ado9Rupb8Ebvtfcoqch7gvxcSJ
 yskH/pdHb9cz4kcMGww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140187


On Thu, 02 Jul 2026 17:28:16 +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> [...]

Applied, thanks!

[12/14] wifi: ath12k: Switch to generic PAS TZ APIs
        commit: d418509383b0c884b70814ae85d3ef105a63b940

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

