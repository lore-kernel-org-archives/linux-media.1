Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3970F32B10A
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564896; cv=none; b=tf6pqZESKLuJGdbVCrGyhCkFKVfLgI1jgFzTnJ8XiLgHmaH2f+eFQue2APOWRgwDLkWQXPEt0nHqwu8Ze9PMReTdy08SDA+V6kfcG268Y/Z+VIPyDOaQYkfN2bxo1K8oCL8IsCzXcGF1LM99DrhCNYeRA7LTtvUnK8yccAThd6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564896; c=relaxed/simple;
	bh=Srv7YZwRGZt3x26M6QPq4Hp84wa5hDmKkBrQtVxPXa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XaH0firX+USXHDzgSinTWBnNdu5UeU/OCuDuz2JhIKVDQGRQgRWNvxY34v5hFAiZsALx5qCaEDEiDUkYe1jb8yep9MQ29xMBk95NJi8ESnOZ5sO2zkvH1Eh71kV8cpv0pNP5fsWCSzXuJFDepeKnjW2jL2X5CMFXw0SGy07Fu+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkJi4OrW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVz1Lw57; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkJi4OrW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVz1Lw57"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CI8O60397704
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Diq1tG25o0LV+02xuOMc5mc02Aof/vsh4RWwsT6di8s=; b=QkJi4OrW9Rvu7e5D
	OGEfkYEXMiWReMJdvkyWyd8c/C2mZUJIKAwOpSYIJTQ7sVALhevGFaYR7yX1tVF/
	92PsTzQbKdfkc9YnvKNw3lVPdzT/jnA1oO8NQBusOFN5YB6S7CGO0IMRMmr86Ctd
	VKWJg7lAhAdZqg858KhSLiQm3npKbCEKpf9NWz0wNiprl1ABmQd//G4aMhVRy2tQ
	lakLSsQBCEuWdKesLDLhKoaJRX8ZHAxJ6M7Uf2/hXn00DOLkP9TTbZsFR0Bq4A5w
	dP4vca7BzxA3BorlDt1ilCreSt9IwGaCYDuOO/r6P/rWFRl7TWlgiq4ei/KaQgHj
	KBvTIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0wt8rfya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:01:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so152214385a.2
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 13:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786564893; x=1787169693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Diq1tG25o0LV+02xuOMc5mc02Aof/vsh4RWwsT6di8s=;
        b=YVz1Lw574kOUUHOM8hMP7NrZHLngaepk4/3qkJeKWk3cc6iDAPDmSMdVQCNPQyUBEt
         gqtTsY4hDCFpAQqiZda/LV49XS7M7y/crxApHJIdllbU+bcx0klbvStT55fRSAYmQHb0
         KVK55j0610jnCgS7A/vPFaxyzoh9sCU9NX+USyy7YzxbGHr+Q4mrn/UisXVqNRiLYySN
         NlWEYFTkZqZIz5d0wznBdd+05YXwtl88v2lkC2enHdGpiqyXM9N+ce6NZdsmQ9ZxGjkp
         svSAVITwlDZV1oUrcrvZk5x5QwdlzGXOK9MBffd8nPYhyKpn8RWfzEoZqlN/U5Id7jUw
         gUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786564893; x=1787169693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Diq1tG25o0LV+02xuOMc5mc02Aof/vsh4RWwsT6di8s=;
        b=G0gdZfLajTVrN2Nyr4PyWXAXi9dnuFVUT5Qnegzyqi+24y50Htop4oY8kjdgmvR1Wd
         mH7yZ5VM0XS8A+wpSALCb1WN2hX1Eo3o9jc8e/5HBfS/9v9iY7uT6mjJd559WEPMMNfp
         W/vE1Yp1CL33eyTjXKhSV8HpE3N76+QJQcGLFVLhDzOaNtnnOkJ1EM3ZJsEaebwzgFji
         9sUJZi02XA3Hg0al36nEQ3oK6cNTFOiPMAz4wMZFVMBumZqbP5leBjmr+/p9GYY/h9uD
         vKD+AKB0p3MsDyqhF738mkutx300ScDRZQXghkyIKOrQ0My9PjnMeaLalMAbXY2YOEBi
         yi0Q==
X-Gm-Message-State: AOJu0Yx5EdTHUIFI7xaJezLhw3lU8oQYShQngAkIbEJ1R2UBXKMl9KET
	CPrybNQQetglyVth1vuOasKeUVXuSMwzAOxlg+OjC/N+3glS3nSnFIpQisXDXvvjnEh+KLIzj4p
	KZ4AZtxSS3ZHSuzTm0FUQ30K7EA2+AIKF0lXvYvnJxLOL9ngq1kKp/LOKzvk18jxD5A==
X-Gm-Gg: AR+sD12XNUbbGjrpbrdJoxDY6YOOIjvICSqtK8iGHirr6JbvVgoqpu0vaUt/My7jXzP
	uFKShB834fTtLYMhk0pCHO88Bp5epv+CkFgJMdapIQlmq3PSclWbkB6DALNKaqdYNwV5gQyMS4X
	WIld8Q4BqV3OLybNrWOTZ7L5WmybruVvjNvxavaA4uWOgXHnUY7DSUoHlDjV3v0aOn7fPDKzYqj
	woGvgJmWb4bMVfvtO2h7JVfWCFtKTamhoFV7PT3w7qRAQhnqTpPGDkCYLTsqD8vKfCYfZ6SSA4Q
	+7o6eFAohWlhQTAceSGWyWdHVc+0di/2ZAU4p4yYYg0bBdBhCTt2A0BhuCvTsHkYIbMmZOeM9hX
	9pSY/e6qM3rv0/ai+oX5HFczCZLpKkSV3kOLhawWO4yp+JDIUkFR+kzEDrLlQ9QT67VAj7rrVkQ
	==
X-Received: by 2002:a05:622a:2506:b0:51c:52a:8e70 with SMTP id d75a77b69052e-52d73c274b6mr8194741cf.2.1786564892791;
        Wed, 12 Aug 2026 13:01:32 -0700 (PDT)
X-Received: by 2002:a05:622a:2506:b0:51c:52a:8e70 with SMTP id d75a77b69052e-52d73c274b6mr8193411cf.2.1786564892161;
        Wed, 12 Aug 2026 13:01:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a11b2acb0fsm354561fa.12.2026.08.12.13.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:01:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 23:01:23 +0300
Subject: [PATCH 1/3] media: venus: hfi_parser: account for all capabilities
 when skipping a property
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-venus-8996-v1-1-6615f82a63b8@oss.qualcomm.com>
References: <20260812-venus-8996-v1-0-6615f82a63b8@oss.qualcomm.com>
In-Reply-To: <20260812-venus-8996-v1-0-6615f82a63b8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Srv7YZwRGZt3x26M6QPq4Hp84wa5hDmKkBrQtVxPXa8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqfNEWqA3ie8cFiAO1nWypjTLI4TmhEdKGHed/Q
 3uVr81Y3SWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanzRFgAKCRCLPIo+Aiko
 1W4ZCACD/Qht2Hzl2eNlq5y+emPJoSGrOe2OtseIwvVh1pe762IpqRzANftw5A3/GYSf6wmEZAJ
 Rvn4nnRPZLnccr62udjtEO8NTZWhPE59Xzv/5/0kgPUsa5ZLEyfX6sLJ6iDjWdAEAENFFxJsEm+
 rQYYWSKxYmSLInjl9RxO6ROTLt+CViTsvOQojcoRjElioPK3hYO5ECeUUCDoP7fr09cRFxk/4my
 zLlLBLHEQyR9ie40B6dnhL69zyronnfc1dHzcBBoFD+ZjplWWtpBlQ+I5EQRFCQjy8pCFS9wPLF
 Pzli7Np0pTDgnVt8ChXD7tFFcoEypJZAcqy5UxTtT9F3Y+QH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YLqvDxGx c=1 sm=1 tr=0 ts=6a7cd11e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=cdMpqBep0YYzfnNq6hAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE2MCBTYWx0ZWRfXypwnctwaKSft
 fLWEQ2DEVBNtaOcFi6qCTzIBIlDvA6MTU4N9Bdu7QZmtm0Agyc3i11AT3/KYFhBVc2tx6N2zP9i
 aVq0zN6g4eM2VGnsqc0dcZuWZErDYjOapNYm4EIgyrarKBhSEPeX/Ek5P9btqTqGsh9W4G83mv9
 dcdW0QIMKsT+SWrw7yY6+6srT6z4dOOe2K1dzoL0In1kQfXxC/wjEmPPSuBqRK4MzQg1ROlkB0Z
 rKiU9nvXeswDP2+50mBtnc5IjDpA0oizh07o+BTcrOr84tkqPmifoQO6WIzLCrAA0PrP/Oafm83
 tSzy56nAb4q0Ae7OalYCvy/tKNTu1Sl/DGyrkth+p1Ecn263T+w8C03kTj9R9tys3QHY8c1aNSb
 md8/JV+coL5nhSWtoRZYBY6fGKZpMtdE+Qa6Hy/TVGH7QjzJ0bTbOxNShrAz1206LiSDXYmQHtC
 yaFJeknOehpSXaTdc+w==
X-Proofpoint-ORIG-GUID: yXLgnLBqToIsOk8pCsN2f6IEiPuj86_6
X-Proofpoint-GUID: yXLgnLBqToIsOk8pCsN2f6IEiPuj86_6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE2MCBTYWx0ZWRfX5DRerCD4JHtO
 TvkfNMj3gQRoD8fFBLtHDpRt3XWxmBw3piRQ5lViHyt61ytxEcXhbclSieh3TXMsiS2OP4cDw/6
 ShEIjqSe5pw04hr7/lALMypjUonikbM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120160

hfi_parser() walks the property list of the message it is given by
advancing over each property by the length its handler returns.
parse_caps() returns a fixed sizeof(*caps), which only covers the
num_capabilities field and, at the time the code was written, the single
struct hfi_capability that struct hfi_capabilities then declared.  A
property carrying N capabilities is therefore under-skipped by N-1 entries,
and struct hfi_capabilities has since become a flexible array member, so
today the whole capability array is left behind.

The parser recovers from this because unrecognized words are skipped one at
a time and capability types, limits and step sizes do not collide with the
HFI property identifiers, but nothing guarantees that: any capability value
that happens to equal a property ID is parsed as a property, at an offset
that is not a property boundary.

Return the length the payload actually has.  Like the other handlers this
leaves the property identifier itself unaccounted for, so the walk resumes
on the last word of the payload rather than on the next property, and
relies on that word being skipped as unrecognized on the following
iteration.

Fixes: 09c2845e8fe4 ("[media] media: venus: hfi: add Host Firmware Interface (HFI)")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index b1657443f23f..3413b91b0b7e 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -146,7 +146,7 @@ parse_caps(struct venus_core *core, u32 codecs, u32 domain, void *data)
 	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
 		       fill_caps, caps_arr, num_caps);
 
-	return sizeof(*caps);
+	return struct_size(caps, data, num_caps);
 }
 
 static void fill_raw_fmts(struct hfi_plat_caps *cap, const void *fmts,

-- 
2.47.3

