Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979097;
	b=XF+uIONWDLicGCfYilirlHo+pYVpItRvdnFcTcLUXr2/dPxX2/GFTam4h7S6HEs6GG2o
	 gHnR35dM9g/ZWbN6HAFfCBcOCzBoLcKci3DdR2UPNPuM9Zzhq0JSDV6/gklhImYba67rO
	 Vast4DPaUBc2/rRsYxOoSOgsszWonYu3zNkF9GIHG+vIXxhIh6MdI4f7lcA7iUax0MNBr
	 89B3ntcHJ6UH/G0INLyLY+kbVHQ/mxGSybXRYYdYpRg/ylazo81T9JRRf9OPkKM6egauR
	 I5mA5d4IRtkqaercuW5HfHKVjN7/oZaiqcumJ5fzq8LLvDAdcgiFWDlGhotK7VyQvUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979097;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rMEorqsm5pYmFnOG/VT/hoICsnQ4PWFNPxl2ScC7y7M=;
	b=YPQomSZQHAkfZlbXLC2AnMVzImBnc6troVnw/Cf1yYPV+XS08nTzH21suS2bfHjC09N5
	 DG7K6trNUS+uB+47FX4J0Ju474P3hzmKbngKiTkCqMqrTrRp/z2HHUnH8aRPa45rgGLoe
	 63ujLgZ9NmZBOgasilpTb6VdfSFhh4lXH2asOyYKCqzcqZ21NAF59UkfhisTx57P/NmF8
	 st5TVgSITbO/jqqI9ZW+hP+DF2LzIp/7uaGhXhvIOWu4L6cTJvajoWeG40jZJYZtsH/6E
	 uvtZj94+iNUw9MgFS9lUoG3LGjU3LpFkhzfrnxraqynDNP7s630aqdr7a7vEi1P61Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWpjwBaE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fRKhn1vT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E2D606A329
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 15:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E2D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWpjwBaE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fRKhn1vT
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F0LHx3927600
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 15:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rMEorqsm5pYmFnOG/VT/hoICsnQ4PWFNPxl
	2ScC7y7M=; b=lWpjwBaEKXb5o6XpgJVXUazxxmUjLCzISZPNG8YiXBFQLgzJG+W
	y3C9r6cVlMMa9RNfi8xOpVQRDWcalIqn70FUa5oz4QWR28Bheln38mNUh/Z5iC8A
	7vyFwSkEUBlPp34MOEdQvP15FdHzJINEWeDsJBwQkGzIP8m7/95VIRJDoM3pqxbE
	i1VhDTQVpHdibAbp82FWgGAzmVgMmbPxWVcq5UMs+6SYX+AymRHtnPn3VpccFQpk
	x15GEefyeV/3VIuOs7DdNIXeYbGjBrw0RaWcbLcVwiy0nyH/iNcDox1meULAR++p
	EAJjrStumLyrFFINzkLN4gvcwAf8VNpqvXg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa3cqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 15:31:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3700be873ebso552242eec.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 07:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793979094; x=1794583894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMEorqsm5pYmFnOG/VT/hoICsnQ4PWFNPxl2ScC7y7M=;
        b=fRKhn1vTN0Iumm7bTnmiq+f3Duq6spQsILkyqn1nGc1r6umvxQ+BQsgRRz4sKfoBo1
         cTUoAwldoYWu2AFvABamdJWrmWR4+kSE3Swz6v5jVY2rqbhz6uUjZVgH+KNh63Q842jH
         mhZ5iIv/fOTfzcBBfERMB4/k/nestjIUpW9Y478LIEEH/lN1d1dyn7hEl3yVfpj0StWD
         A7Rf78Rcg6FD3YHF4EgFyUPyMlNTMwfPKPKWK2ZPJNiYnbC6UMPis2VNiTGxSztwk5hU
         HgW52l0i54zn2YtkjP7wioCeu8tBqOvEwzunsR7V6i4pOVbjnxarHD6F53eyak9dnX24
         LcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979094; x=1794583894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMEorqsm5pYmFnOG/VT/hoICsnQ4PWFNPxl2ScC7y7M=;
        b=gF4RQK6B6xtunHav3YJ+9ktQI5/r24NE4heJ5Wk6L/oU5etzbDaZXmWNUPpmw4j6rF
         VJE6UTbCLaaw9DZr6UJFe1g4T5pAeEQkToDMm9ePHPJEsez16ZosfRPVraXtGG3xlb+O
         JlZZtVxpLOL7/m/qdD820QHxYMOjOm6WEbe53PgIE3l7moB+M920hMaN0ItPSxGWconh
         WqDUR2D/IRQAs74i4sKqYrJxxwfsXuGTYRpRsNjL9jWm6PFuCjp2J1BXBO8EOYEOIl3P
         64jmMV/kSz3lAjcSha48RVgAc//U7ACliPxZxn4dFAYRjul+Mu7HUUCFmmqA5erQoaDl
         Oxgw==
X-Gm-Message-State: APuU4Z+bS7MDBa/Ok/b0Qn6/3PPFT3/WWFaRbdauBDfpETbmnv8OkkEL
	Z3NB7zjX3r5FKoe9AuDNCi8ENS/4uZmTVOYg5W47ZdAqIwSDzzBWsdWdOOcdbMXYXKZb9JyRluz
	SZKZDOjxA2n7bsP3XUvrISyC8M3x1GsH8xTXrZxp4+Hn/Qk2abDLXLchbzfb/xuJfdLnSgRrugg
	==
X-Gm-Gg: AYBFou2M+5lVfQ7a9auKE2vrkmATgjhpOm8EzxJZLI3+FQiPeQixCyqkMR0/ClHTqB4
	npYOfF3SwgN/XEzsfP2V2es8rTl8VROehOAsNAJ+fRf+zzS4ajjnyjIF51uZtVE4GJCsP9bp5i+
	b+7iODImsNCj/BailFOcbCRNhMSRgfKXVKfHvhjkqVyjxEatAaBZfmyzX1Txbaeovx/ZZABfbHO
	OZX1uBOiHPzOA5f6m06UPxWZllrpe+V9sTa2BFut+Sv28xykzRN8WwJKSbmHKUR9yGFN+38K948
	ch84HLTkx2lCfFsbM0vfMOI9u0nBxN5OIUtiJcp5okECZ2DYR3L2sz4F8/TeVDG7HcEv8e/bslw
	ATkMN96qSh6ZcgEkW39iF8hXQPPboZ7sjgtt7a7348JMlpENgLi4u0nVKG9qagg+Mt1/VlvcC4P
	Fea8jOb00=
X-Received: by 2002:a05:693c:68ca:b0:36f:5822:4bb2 with SMTP id 5a478bee46e88-36f5822944amr4017431eec.19.1793979094056;
        Fri, 06 Nov 2026 07:31:34 -0800 (PST)
X-Received: by 2002:a05:693c:68ca:b0:36f:5822:4bb2 with SMTP id 5a478bee46e88-36f5822944amr4017399eec.19.1793979093356;
        Fri, 06 Nov 2026 07:31:33 -0800 (PST)
Received: from QCOM-seNJUcZa74.qualcomm.com ([183.82.133.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm13618197eec.15.2026.11.06.07.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:31:32 -0800 (PST)
From: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: qcom: iris: improve error diagnostics
Date: Fri,  6 Nov 2026 15:31:22 +0000
Message-ID: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-GUID: Xez7se4qYy5KDSZgB7putzLEzwPz7O2U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfXxJTyOtInD1H/
 UMAxKiwSuasBiNjJcQx1yUiQpqkdOm3qS/KaMeuAuvomt8ruZsfQZTRk+iaRzh15Q7XViG+HNqQ
 EpHyhcc6KhhEC2Dmx+z+bnB7ZYUnPCAi4wrRR7FlXxpwrQZVQaCWdupOT/sAkX5+EG5T+jroajh
 M9rI4hl5RPwqN2xvJHgZ9IATABg0mhah8/+UjBOxO3z9MZlZgXpEW3+a2PeuHq+bc8rgFwyddK3
 3joatIFG3MpA2mMRe9OdvpHZ/qLBPeB+pTPqKjG26jXfU3i88BDksYv7o8XFl4l/pVlFZNjJa21
 kYCEdz8KzM3MCu9ttJNEtbJxsK9kP+Y46oXLzyejYnaMXRpBgTB71P0Zpy/sPGJVrNgDfhlAfPQ
 GJsMtbaHhHTexTJiQ6TuxR5/0PrMA1/yza0bXMBvfXX890uzTQfWADya0pDZ59FaZ6QIedTjBsh
 3xRWQnEUc3ZwvMW/88g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfX0iEqU3KFXlmb
 ncSgC26+nnI7v/V7TOIGkybjOzQJ7b24lr0QNVw8mcAdYTUxpI9j4GoZH1Xjst/gwi23Y8Lv/2o
 rmqw0VuY3Ccl0aRUJ1azatNpmSP9UlA=
X-Proofpoint-ORIG-GUID: Xez7se4qYy5KDSZgB7putzLEzwPz7O2U
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aedf2d7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=4lT0C3RFl5dsjxM0/Vd6wg==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=wK5rk20clm7eK2MKA1QA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060061

The Iris driver can return probe errors or enter error states without
logging enough context to identify the failed operation or firmware
response. This makes failures difficult to diagnose from kernel logs.

Improve probe error reporting, include available return codes and status
values in existing messages, and add focused diagnostics for system and
session failures. Report recovery failures and provide debug-level
messages for successful recovery and less actionable events.

Dipayaan Roy (3):
  media: qcom: iris: improve probe error reporting
  media: qcom: iris: add error and status details to diagnostics
  media: qcom: iris: Improve diagnostics for system and session failures

 drivers/media/platform/qcom/iris/iris_core.c  |  2 +
 .../platform/qcom/iris/iris_hfi_common.c      |  4 +-
 .../qcom/iris/iris_hfi_gen1_response.c        | 16 +++-
 .../qcom/iris/iris_hfi_gen2_response.c        | 15 ++-
 .../media/platform/qcom/iris/iris_hfi_queue.c | 12 ++-
 drivers/media/platform/qcom/iris/iris_probe.c | 95 ++++++++++++++-----
 drivers/media/platform/qcom/iris/iris_state.c |  5 +-
 drivers/media/platform/qcom/iris/iris_utils.c |  2 +
 drivers/media/platform/qcom/iris/iris_vb2.c   |  2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c  |  3 +-
 drivers/media/platform/qcom/iris/iris_venc.c  |  3 +-
 drivers/media/platform/qcom/iris/iris_vidc.c  |  2 +-
 drivers/media/platform/qcom/iris/iris_vpu3x.c | 19 ++--
 drivers/media/platform/qcom/iris/iris_vpu4x.c |  4 +-
 .../platform/qcom/iris/iris_vpu_common.c      | 15 +--
 15 files changed, 141 insertions(+), 58 deletions(-)

-- 
2.43.0

