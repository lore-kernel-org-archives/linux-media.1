Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379356;
	b=H9JczHJf5TecetM6Tw6Qg53O+rf2T4WNQHXU9/zvM+UzEvLXOHD6ys0Myj4wxjlGKDaj
	 LsIIbFbYLBBLWEdaRsq1dpcBXwqKFZU6oNezGFVgcU3b5UOYqdoZmIpZz/eCztTXhF3Zs
	 Y8IrJ2DJKnRV5WJ8kVYfp2gbWdZq1V2uGWd4ick/VTD2ZjrvAnwIAgDcpdgofN/VMwKw6
	 eHMGDWXqIlzfKY2rmleMXqtkdSXaPT7SidxLtmfaX0AsXsV8FHW9OjuMEuQuZlW8bRKPm
	 pJOkug+DB/3QTuqjkUViFVYjthnw5SJNH/kYL5JAZr915UBQbfLU7bEtDDktrcX7x+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=;
	b=skQnnKy3Uq/9fERbRSGZUDs6pdOOhAoZbstbn5fp9N/CBYl52PhPEccaq/GjmlUG0FXQ
	 vmPfnpyJHWWkiwqXkvEviKAhy0VzS0cqqNuK/teNjhI/KnMc+iL3EptVzwsihcJasFlgU
	 AA0FEd2+HAMQa/uLoUZ5niopW1ZZps18wfb0oscYrr5+4SY2tCkP0t1lXdwDXprZ4LDka
	 t6anslK1IHtkW0HX7R7XX8UcjhNaCum6AWQZw5lljWm6jcMNviutz6WHK3VbkNzQVmedo
	 QyIg8p9pE6RMYivWbqIVJnrun6QFem3D7nfGbFcRPeIEex9rcdnEZsCKmmUPK/LBy5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pcKpA1QB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUwJzgz2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6150606A31E
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 16:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6150606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pcKpA1QB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUwJzgz2
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UF5ZZb434681
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 16:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=; b=pcKpA1QBUxKqAvAF
	4lK/xm6iCV9fsyY7HjvxQF79U27otjHQSDOsk8I6TBHx1rzXcSG6P6Sk1o3dVMv6
	iwS/xrcqK4vAylsQhKPjBB8PtH1Oi2T3Rco69SOIUBrDxgrPfgOnvcfnIfI7nQq7
	GGUcOA0EeKPoFs9gFW+t7pvkgPjK60RuQ3en/uoLj4biuV2wM4qcptDvFsaIkFGU
	cFb79XfkkHmVJ2M70Gvo68H3Vnm2kOf85EnQx9bbj3xz3d/jYIMUxr/380L9ZHgK
	e8pg8KHvQvVK4xkCIagbk73vhl/qq5Hz1YNu0ZvMii0ep9L3WdtuJxjKeNsBYsud
	NZGOhw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rm6un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 16:55:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so984529a91.2
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793379354; x=1793984154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=;
        b=VUwJzgz2U8V9XOm4OUCG4W1Vr8jg0ULn4wyI4l7bmpqINQH0rKREEvMArV5gjRVziv
         LuLcQOQMmgPyhkLIKB+AkP1DCSwMIkI8MK0jRtNTvYPsJK9XWW2JQfnJKD6Sasck5iZD
         8H9VCqNNeEYFmpYZzLAFVAY2FtnZympio7pzrPIlFJKMmpQKoEPYsXdoVRYgkW/lB4Ej
         vDZJd2zvEpESjf5Kravzsw6sImea7NLDCwLRra5Wx+XUO9u/Py2AGSBd9BZ3f9vQQj90
         J+Bco3znVkORM6zGk6xp2nKKRRXUgqqlQ88u5v4fNMSX2hrtGz9edx3ZRb6VgYQfNQbT
         0+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379354; x=1793984154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=;
        b=nCmRsDcm/atdpcm4KdNkDvESe4ZZ8UOq1p7J7Qpl18cqaHOVMn3i3JApXyCni4sAl8
         InS8pqkVo4hkF4eGENE8zXaYBIY1/xWwFxJWE2wIAxzyQHyBJ4IJ8gu+NytYwinAykGQ
         QoiV0GtECskFmOTjRNreX1QN6UH9odHkpt1RHdgYOfbZfkJaf1zZiTLfkNjII3ZluXmm
         sRnbK1dzB+3coFpYUSVh9HbJMxsLVcBwIDlU1aU/Cv7brPmZhTdAWo7B2k6er9WDpvQu
         M3JFh2ekPRtbwHx5zOkOqeXocTP2jJeEAXcLz+60zp6n/UG+OEbnz2YZ8hgw9ME0VVbE
         svWA==
X-Forwarded-Encrypted: i=1; AKwUvByG3J/kFcYCi6x2jxhzd3lGy3OUM5VQGJUsD/fwrA1DEWGQDzBnAJrOOfY/h8Wa+/g9q5eT+kExrTB8NA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKPFYQuunhCfxNGmwgKLF19J+Xsce3v6LtfCPI9KlDAaeAwKo8W
	/TzzBH37GKuNYQbBrNdDAhLyQOVZq+zK+UlitRUhw/JgHLsWZ/p1dTVmFP/O6JeILyDM1wcAM9a
	kQFZuDv2TsLJa3tx8gBziMiDBoyRFnBK51hDJMW+taHzOOpjXvW8HdDXdZfMvyEa4Uw==
X-Gm-Gg: AYBFou0yPukyFtICx37x6T72py3nTj+EePxVCuDoz5aWud9Tjw1QK69sKLQl/Oo/CPK
	SWy3bh43KtLsonSBSrDK0E1KPRIZAVjDW9HYZ+jfhrjrwvW+uQ9JziQ0AJIpXgMCfekdOMhL0Xk
	UtZkFzz9tuSHJYOW6VxcIe9+QEtkLEKgrQyLfNGtIDdW/45l/tFpA8Bl8FE+Yy9wTaUDOXO1ZOy
	tecnccESdSGDlRGvk7V/pQDx4lyYHv31+/NHvzAQoFYLCH4xVnlAIo/0D4QwNUnu4sXXqyY3CaJ
	vqBMuppKPMGwoCPo4EtmpBnh+5ra8sjbKL78tUP49evtXUzqnthvDcB/cIQXARRxVvzdQAbEdBW
	F2f9xV71xZj8Xh29m31uBhR5sZfKTpyYW3H4gghAtb7JQBZ643qcWPeZAkS4QjXihOFs3WGWrgb
	zP
X-Received: by 2002:a17:90a:e7d2:b0:3ad:a270:a623 with SMTP id 98e67ed59e1d1-3ae8957452cmr2511736a91.4.1793379354256;
        Fri, 30 Oct 2026 09:55:54 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d2:b0:3ad:a270:a623 with SMTP id 98e67ed59e1d1-3ae8957452cmr2511714a91.4.1793379353761;
        Fri, 30 Oct 2026 09:55:53 -0700 (PDT)
Received: from [192.168.1.14] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096d3844sm1087439a12.11.2026.10.30.09.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 09:55:53 -0700 (PDT)
Message-ID: <8e78ac53-4dbe-4684-8f3f-00f841c60972@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:25:41 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 10/15] media: qcom: camss: vfe: Add support for VFE
 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        rshankar@qti.qualcomm.com
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-10-95f250b18612@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-10-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MzZwEB_yssnm_QOvSvT15UUqvKwHQ_Bp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NyBTYWx0ZWRfX63oDJpGFnILY
 wZa9A9hB4FM+0b+GF9x4/paMp4+eVJ8/rwVJ5zn/4eO8DactmuLh2gHxmkbd8vboP3ulVqOdeCJ
 DVyLJxbx8736SoVFIxu1zmKgJrZz1LM=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae4cc1b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=WYfwUfNkXDalausCwDwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NyBTYWx0ZWRfX4+v9DkHM7sNo
 Q8AMCN+vq8AvH2IwNHJ8qOBsS4EiISUC8d8s5RQDYsmWDNC+5Iuid6L09FcRzp689SXZJn9uu4v
 +YHbzO1ZuPuYN4ScB+O40BYLzN5b2Lc1FJwC96CPcookj2zLOBkfNSuegozLQN7jhAi9mjnuSKJ
 Ds0JkxE+q1+CdQi01RqQ2FsXZP27jz64Oq5JjJxk063hMnUUu7r+kN40u960Fm0uCMOXn5n99iM
 4hNzYIVdTbnu3FoBHRD2oAhuLuUWs/ysmEYOUtYOq5wMqXi7wP5VxUlQIAZbVTGHihD0LGj2PCh
 yrrVtj3k1lDWDClXlLmoIfy55hQBuWOOTGxDf0YQ7zOpoA9ZyXBRDIJPLrweuOqnf+HuZBAItKK
 enK79XqoKjl/4RWbGvSrPpfzzGOlOJIB4OS9uiRs9ltNvAQ4V46NriPd5YjP8WD+IHeXUd4ahuT
 RXHOovGhywdAZIA85RQ==
X-Proofpoint-GUID: MzZwEB_yssnm_QOvSvT15UUqvKwHQ_Bp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300067



On 28-10-2026 20:50, Hangxiang Ma wrote:
> Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.
> 
> In the Kaanapali camera subsystem, the front-end blocks are referred to
> as TFEs (Thin Front Ends). This driver continues to use the VFE naming
> in some places to preserve consistency with the existing code and avoid
> unnecessary renaming. Support is currently limited to three output lines,
> matching the constraints of the CAMSS framework.
> 
> Kaanapali requires REG_UPDATE and AUP_UPDATE to be issued only after all
> CSID configuration has completed. In addition, the number of AUP_UPDATE
> requests must match the number of buffers queued to the write master
> while it is being enabled.
> 
> Although real-time TFE traffic is routed through RT_CAMNOC, both
> camnoc_rt_axi and camnoc_nrt_axi clocks must be enabled. This ensures
> that the PDX_NOC, which sits downstream of both RT and NRT NOCs, exits
> reset in a fully idle state.
> 
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Kaanapali MTP
-- 
Regards,
Nihal Kumar Gupta

