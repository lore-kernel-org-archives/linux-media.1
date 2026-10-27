Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093900;
	b=zE4uLYGanRMRu+DvSi7828N82bvjPe51c+RmqK0vg6QeNlCGSIiVvtL6vPZ6sRw7QL4M
	 nNWel72KWKrfTqwjfBQwkVt04ML5XKsZjP5l25KqDgS9d3NLHywK2ahjK5shY+vbfrAtJ
	 2ten+guyIhw6HSLEDAJmDbZoN06PrH94dLLgllFHYeVGhRJ7k3zdFEKyu3nYnHLtnHykc
	 J9QCJnKVcbmCKKcn5vIb4gy1gvn+oUeNZgLXhK75+AZ3zI4ZtoF9kzm1L9j60eFT2Jkkj
	 0ITXMCVGzze7ngM76No0qzXlzxjeJLOMA4kFZ5/2z+VKvH9JNTcSvFmpWurTjXw+KOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UFkbhmoj5DEgqsYcXY+vyh4nwgONpGSbK7bxlUjEPGg=;
	b=TM3dZcgmfQs1TltOmG3llwm0H/wUp+YfJcofm3w1GUorvHaPNjpF9S/dJ1WSDYX2tZtq
	 iY/BAzNJNYEFM+u1pwJAZSankNH27cbX+SQIOcJBqPC1CSciPkntLOXiXzSYKJi31y1vl
	 T4vhGV3CIj4PnHP6XDn6Am8QOi/KZNafUisi6qIwgQzd8tNqR9LjtjpQJcsxQWA51bhfS
	 HMpfKMRQB9PL6SZTcARe2Mjfo23cJhggnqbXltXlRnVL/JYtKlL4+WHGlpRW41YC53vV9
	 +0UcO+a0VMQEM7UKdPwAo69Nh2A8dIrPc5eoGKFrnhDOVyFjOnBI6PWyruO6KLvtreQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3dL54E3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TCI8VJLI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8197606A31A
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 09:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8197606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3dL54E3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TCI8VJLI
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gsYa633873
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 09:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UFkbhmoj5DE
	gqsYcXY+vyh4nwgONpGSbK7bxlUjEPGg=; b=N3dL54E34a4N3pgNAq9hH6E99zM
	C6L1/9505bXIrMx9d/qeq0RbbDo/RPxtNy58B/XtLDyfDQuNhFYzDc/xRau0G1cE
	Y/awqXkCMINsxfv6yXIB1v1BZvoYaZ128CxG1sRdt9AYtklbeXz+s9FLoYRw9Edo
	Nvla4urewjc3lelcOYcnvQCcg+MNqEWsxL+tGk9xB7UV5LTXz1mIFI4RVi5a8RDq
	KLZ1GyNPg2ifXlg6LVb9kvCg+zzeSbVypo0Ss9keI1BZfobxWJxYrPzLamQzOY4g
	0hKG6blk9bJpl8f8CesIoTUTlq4buo+ibOsFuRVbehFTYbM8177bLRUf15g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smuta1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 09:38:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c70349f65so12201666d6.3
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 02:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793093898; x=1793698698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFkbhmoj5DEgqsYcXY+vyh4nwgONpGSbK7bxlUjEPGg=;
        b=TCI8VJLIHh+B40XyQDFfNy07du1F7pWasolG8s4ybHRO0XjVUS68O5N91OMgt0LzC+
         bGaAlFobhGX1zhFN8ut3c7YGe2BvUxR8xkLKxONDAwiang6r/pb5ui9MX5rYshLa0jQh
         1nM+TGoiw/q4DxKTd8x7NDqtO+7F402qDhdSiOYGszdTRmJOsUtDoOkR8rMsXpgQTWoK
         QGU7B8oNqiA0oIvtUAEpW1kH/PJ+R6fRuqI9iya1i19sWDW1kr/6JNzPS2mGv8+ep8q3
         wjJPqQoifyYHc2nOOxU2XOsUSSv/Nu08YTNH1heMiHsXRCT7fSAbKU/d+3l/dkSVYm2D
         nHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093898; x=1793698698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UFkbhmoj5DEgqsYcXY+vyh4nwgONpGSbK7bxlUjEPGg=;
        b=FHVP2LzoZga4k7J2YTolzqTdp3hwlwZqPxl7mSSoEiZXbE3PVnlI0WP46GAPWHrDwN
         oDAUP7bDJFHvg8UlhHgTBbGZACvL6VHFmK1iA70JqtcaidFjDZqs28Ea8SMr3SjvTD5W
         lyjohru3MZgBetSHe3eMHErmcGilgAmGlvaqWGOkUPWPxlCGl5gVvoOE07RFck/ogQ6F
         WUREgNxKdHZPE5b0mFi6qwNiJUGbScBR3la0YsxYSMfoM8mS3pryZ47d+bHn1ya+N6Vs
         uxXbf/3V+OhVvTlS4yg5IqMvatiE4u7uFtsDODWUWfbDUiuaczCNllb4bkJQS5LbxqyW
         ThQw==
X-Forwarded-Encrypted: i=1; AKwUvBwLxyBq4P3OvBvnhDi8UbhrxGBVARU3NBM5CgCScc4S7ke/moQHFD36fuTeAyFyVVVneKbs9C7qz9t4lg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIy8NbBRm80011fS24UHYZD80Vdvb3kf973Xp8O8L3tQIf7Rvjo
	bGRCCPrFCgrC7SCsNA9YWO86CMoouBUnC9wwdvffCR2gY7nciimuGAITUB2X13gZjqApQGL60SQ
	gVvZGoQyBWSctynU56/IHssYZ6jsz9IP3BRdk5DSPK7PsbRRh6Cf6VIGjdU/21EydUA==
X-Gm-Gg: AYBFou0i90IxG+WN8GclRGgOmfyY7U4PTUILTtx7vTFHTLV0HhQf1Kev88cMMLHfWwK
	XkgDSUEiZdF/AdAXdgwRXfTg6ZyMTp7/Jwh/oGklS+KAD+dBGTkOTSeXS/XBfNGJTtpRIjLOL/b
	/spVWka7gZw1sy0uQpuOKn7cAZl4xXZ8cGf3JdUJ3VR366VVpgC2NqesCeHrFlDlDkF6mhdW2Kf
	k9OfgaN9brTF+UuyKpeS9ikaMQ7sAg6z/GHudqc539D75GZs5cKWaySfEUzqM8kvraoScriVSz6
	9HJVzcmrgaULPImgrY2ivaDyXzVoZdF6pEqQr33doEqNZ9WWpb1nZjpKPuo4EDsy2saEgkKuylx
	kdAUE78Y4QiyTKA3bjFYIVkSb
X-Received: by 2002:a05:620a:4001:b0:93c:ca09:aa34 with SMTP id af79cd13be357-940ef955604mr1315272285a.46.1793093898018;
        Tue, 27 Oct 2026 02:38:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:93c:ca09:aa34 with SMTP id af79cd13be357-940ef955604mr1315269685a.46.1793093897466;
        Tue, 27 Oct 2026 02:38:17 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm264678145e9.11.2026.10.27.02.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:38:16 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Tue, 27 Oct 2026 11:38:14 +0200
Message-Id: <20261027091922.3290180-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAFEp6-2NoJEfH7cT1jwtHaeQW-__A7OeCJ2rY_j4f_65wHQM5A@mail.gmail.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com> <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com> <CAFEp6-3WQyjjFDjUMeVD7QDAK0VNhfD98XFw2YYJ8FZi54yypw@mail.gmail.com> <c9d017f7-f072-4533-8b2c-a87ed67a8712@linaro.org> <CAFEp6-2NoJEfH7cT1jwtHaeQW-__A7OeCJ2rY_j4f_65wHQM5A@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: Fk5pAcEf9WIfC55SdJ5zsOY4VXle9jgk
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6ae0710a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=-9N3Jim173-ToAEOIP4A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Fk5pAcEf9WIfC55SdJ5zsOY4VXle9jgk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfXzq4RWDGvo5Sq
 7qk9qAlmVnnclwL7GYbKB0hoeevabEmNZNDIcfMfMSf/SGAZPwhvfHMINU1pVpiLadQgUtNltgL
 nwGaxNin44gowZmcKZNB/1sOZg/i2Hg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX4dsTAAb/oB4F
 Y8AKmyYw10A6omYMCiCVK2MrLcveYRaKCtniv2mJEDPrUMDl0lDaehFl8O1c1dAjE8pwbCEuJQL
 b0wxwbCerzMAkSYuAV5iD2AfMgtkFAUE0t4ppsJmL6x6HZIt5o9YPMSBDA/OvwthYmiJ9k944rA
 9RDXb3wycCy/R33KGi4jN58XopCO+F6AWp4FFPH4b8QXoTApKJtgFA3ndIdhw5dtXXBiUTyRAQ7
 3IkbtJM4anIqbQySKM9sEFEUSHZ9eeBVsDTTVlmJAVAV9rfZKYsjceBO9DWqjaCgWB6oHmuW4gu
 8P1PGMrTOg2lcjdODjkFlTCFC8RLKiklsJXWWFwjCdQHj9IgviLU3JVBXotk9/wbcp+HZOsLb5v
 WklPxnIT+5ALhxmqcKYDKBISTePUvzkxwLT/L0mnDuCYsx6uYGg/JRuCgY/VczG4O3m41d3H3WV
 LgGz+4kUwgYFMVzivew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270038

On Mon, Oct 26, 2026 at 4:24 PM Bryan O'Donoghue wrote:
> @Atanas could you keep -EINVAL for the VFE core clock and clamp only for
> the rest.

Will do. v4 follows your and Loic's comments: -EINVAL for the core
clock as before, the other clocks are clamped without a warning,
nothing else changes in this patch.

On Mon, Oct 26, 2026 at 4:43 PM Loic Poulain wrote:
> Yes, and we're adding one more in this series (AREG), so I saw this
> patch as a good opportunity to raise the issue and complain ;-)

Agreed. To be clear, the following does not affect v4, which stays
as above. It is only my view for a future CAMSS cleanup: the VFE
clocks are of three kinds, each with its own policy:

- own (vfeN, vfe_liteN): follow the pixel rate, a natural fit for OPP;
- internal (AREG, VFE AHB/AXI): not tied to the pixel rate, set as
  floors and aggregated by the clock framework;
- shared (camnoc_axi, GCC camera AXI): bandwidth driven, belong to
  interconnect votes next to icc_res_<soc>.

Today all three share one table and the policy is picked by name in
vfe_match_clock_names(), so every new clock needs another strcmp(),
and some listed rates are never applied.
Splitting the groups in the resource tables would make each policy
explicit and drop the name matching.

The enable order does not look deliberate either: camnoc_axi is first
on SDM845/SC7280, third on SM8250 and last on SM8550/SA8775P; vfe0 is
before cpas_vfe0 on SM8550 and after it on SA8775P.

Regards,
Atanas
