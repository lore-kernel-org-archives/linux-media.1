Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020724;
	b=taiIey4z9yI/sYxbxy2wQ04ox03c9yDuKCKCLWEU3Zs32kX4a8yblksPPwhsBwkPwh23
	 B6JJ1R9SF6dDzrful1Bc0lCtySmaBGF4hsetSMD6/n20E12KMquBhWpxf7Y50OBfkR50N
	 Jbmb9gxwK3TzGKLjJ0eJ/n4TCTsbw9Quk7ki96iaDDsEC05pZc5wsb89Ui5KHXDDcXRIr
	 cxKfwTdTPtMzoaojFZopN09u8HjMCWQiXitVIYMYD6u80UlXV/1hmNUOMOX9sefuRuJY+
	 3kpnEmkiAQ2PkeNDEaDEeJmc+5AB6Ix28OAJqIpK8x6t6DIUjrM9ogk3BWV6XtA9hvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GUPu5fQHpeRWI2JD7GTQ9q0TkqAW4QMgFXrhw3WM10k=;
	b=AdprfKKACixCxqBb9JpLjVI1ZXgeMbuqvuIqgTTJgj9y8/eCvYjzBYnONPYsOKmfCSLg
	 CrSs67wNlm/28xJTfqA1LuZsIRtkj54YZqohiXwp1r7xQ6oNI7anxp2vMsQVYpMbDhf3S
	 EmyR0HFbZnbMFqbtddOhfMcC1UaTredWoMUOYiXRPML8czOpjsZ3GXTRQxEEQC8TkUbsR
	 EtiU2hE35zKMQ4uPghO0oSJxhpH3PWbE7sPAxpkz7OOMKB3shHP8pXJ4CFeVRXPsb81ys
	 jg3ANT10HGMkQsgBZvpPMbPT8uXWTZwbDAb/D3rWcw/AMc9AI8mKZtVqLcKOBOf9Omg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jJ95T/75";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TV51eRcJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F9460A2614
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47F9460A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJ95T/75;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TV51eRcJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt0TS2168793
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GUPu5fQHpeR
	WI2JD7GTQ9q0TkqAW4QMgFXrhw3WM10k=; b=jJ95T/75awVGsB3vP4B1+UOoQLo
	Qgt7MnhR8qgQLV50C2F0Y1HsERqr17c22qevWV1q66haNBryl+w45Cn1Gz44h0W1
	WLo/JwmY7Lmolo5O17nKU4d/3tNFGKtDkNBRD3r8BD0Tr6GTMlc2dsIHz/Q04QUY
	eAs5Di2dmgTRk+xh5h9t/aLvVeWEGtmA9qmI0XTgBgKubgYXsPx7xFwqHuV4syMh
	LUm3cZAky7qILsFjRPdeOCmmff5Kyxjt3BnEXIHiWlOeokQJ3JjuOrWle5083gOZ
	PB+gEH6ySZtDyg4FSMIABF0pEgb0TULwrn6LukHtvk/0aChiq2PEZ737PVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60xcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:18:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca9b53afaso478360485a.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020723; x=1793625523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUPu5fQHpeRWI2JD7GTQ9q0TkqAW4QMgFXrhw3WM10k=;
        b=TV51eRcJTaNUai6lT4V4UwJKyro0v+60Tarsfa/1ev0IAnm0OePHkzhgl0w+mfXcRK
         eD4Rx60FfP8lHu/sRAddEM+K3aP9CDXQOwZpP55QV7wFTWkk60o243cKvA+bbn/Vau8C
         pOsh7yHnu4HhKjaic1/2DqOocfSW5CJqS7kOH9YlUnvVHIXYV7Rj/2087hBO+yiI7LjJ
         R2dlf1QXtIARYW2xwVf0d4a169thHSPrsdhf/z/S3U1xxx2Zc5tI1wBwc1HPUoq9p6RB
         YUtyASynqxpA7yRyLT0qVfK3G4pASvtzXILfrBvU6gyvbr5z93a+iTLeJ2RSMQlrI95A
         hfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020723; x=1793625523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GUPu5fQHpeRWI2JD7GTQ9q0TkqAW4QMgFXrhw3WM10k=;
        b=s0a4RXKNPWDPODCA5yIlcSJgePidKXf4DA/4654k9TASnTJpkNlsl+frIo4G1w3c8B
         x5CshC8mtcJF36ixQXezPis+lgQHRWvMYBNb8JL4i3QYwJhEgTis7ICkMwFLtVuI/Mpf
         Zf72ZF7wl0z5q9SQETAvKlETHy9Aq11NZJiQq9b8Ca4X0TlUdhEM6qlhukgcl0NX8Vlp
         GxZcoEkzSCYTkZ/qIyxRfQcwhSNws6af7j+SDIIxuX7He5jRDHkkCtsljCSQ07dXIXzN
         XIxyM7/OFbBumTpShGZkYAbZDTPUnbXXpb5xz+IJ5nulvQK0tlvOX9zKFv12m+SJCzZn
         Lcnw==
X-Forwarded-Encrypted: i=1; AKwUvBwDOcQRSho4iCjyfoC6Vzbo3sLWfCCmlzlcj03Y1FmukRXY2yJ9kGW5MGImVxkwKtN+W3zSf5YWSYpgfg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKgtdZY9dkYWJ4jE+hIOsiX3KiWFB96BMkLdz4/Yjf9v+eOADJc
	Rv1hJAJ/CWUvyQiAVCuAi8jIsO851Ysf2ShEV/grJCj3yw4A0gezMerzW8UzyB0dKWhvwFw+hs5
	PeHzde+Oegot1xhgrPDvMbYyLaTrt4QrFf17w9jYPFC6qmGL6yFXEsxRhjYL9jjeUWw==
X-Gm-Gg: AYBFou000eFwrYSZppM9m83Ixg10NY0LOQFQ9uuu1YxhHp45JVZN1kqNkJOmihS4i92
	nYyigTdHIfvjK9MDdMlTOXXv2EvSoDh197Ng+BEe7QFnx9+ZahhPv3A217Zwg4FPN0287E0PA59
	R6acaSumr213T3+rRTnDeSKEuO231s/5bwcFq4WvG9bPKFA442GpPxr22Oj8foVWCH3/9Jk/Fqt
	TUPudIAVfJs5MY9r2S8L0wT/Oux4AqhieUhMu6wK6Pu0IsdcA3BZUXaIoHa/ZK7eq7UV6zHQIxa
	radEfIL4WnhoyidPLE9Uxl8BiyzPnqHbjsfSUjsafDBVBC14OEkHgQGMoUU/bPGe9fcj/OOiBcA
	3EzoBrj4MaXmUYC6F1VB/RNzG
X-Received: by 2002:a05:620a:4447:b0:93c:7955:afd9 with SMTP id af79cd13be357-940ef8fc7eemr865181485a.52.1793020722645;
        Mon, 26 Oct 2026 06:18:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4447:b0:93c:7955:afd9 with SMTP id af79cd13be357-940ef8fc7eemr865177385a.52.1793020722195;
        Mon, 26 Oct 2026 06:18:42 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm158170775e9.2.2026.10.26.06.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:18:41 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Date: Mon, 26 Oct 2026 15:18:34 +0200
Message-Id: <20261026131834.3247963-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <35facf70-8693-4d7a-8d00-b884078f0a99@nxsw.ie>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-7-atanas.filipov@oss.qualcomm.com> <35facf70-8693-4d7a-8d00-b884078f0a99@nxsw.ie>
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
X-Proofpoint-GUID: 5rWm8bhoBeMYiJaH_OkLe7Ih8XUPcCh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX3l4XlbRRh6p2
 2OaXeckWyd4FOSKEkGAr6cQ41tONZzTjTx2WmKixypccHRxym76amNuyRQ79Itwg/SUgISgXIbb
 jqF+JH+q25pSNHoAaUNLuxs6v0YSo16QAglPTQo5FaX8oO1k8GrSsWlY6tR3GaZlKKcVbKbTFbe
 uZLt6AE/wZ92RSxGOde0sfTC/lZDq1NKC8Coawn6gLk+fbO9ALZZSRXXLkSH3kCkklu2/rwoyOL
 r4OOmaOGY6wqVrDfd0pMvoHB1SV9xUfuZ/TE34ile0U8gwo+cgNFDr4yWa9swJvIrC+faaQehTT
 +09GokO+VOWArRwcEcnZCtEnT4ubAaqSW6swxzsQ8HFpJ7CYsF85luLFGAdaqQhfYab/dR8966n
 twxVccxcEf81/e8CKzRLGeactye5chkROg7ii/wRX7eWNN9i+4QIgl6H7hBgBAvm1EO/mcKkIKv
 fYbGSLcTQ/QGUBD3J7A==
X-Proofpoint-ORIG-GUID: 5rWm8bhoBeMYiJaH_OkLe7Ih8XUPcCh0
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf5333 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=mLqpLkQxU2AaqChaJ2gA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX9Fv+TstXCL+F
 UyiAVJI+7UqL6p8Glyqs5p6sASo2sIzM1EYIsO7T+xXyrntac8r5nzYTJ7U895c4d5LAHAefEuv
 wQHIDwYD8stuX+c0TC41a0aeSRjP+IY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052

On 26/10/2026 09:25, Bryan O'Donoghue wrote:
> I suggested bundling in clk_set_rate_range() to this patch but I believe
> it would be more productively and correctly done as a wholesale
> replacement of patch #4.

Agreed, v3 will keep this patch to the camnoc_axi rate table and do the
rate ranges in 4/6.

Regards,
Atanas
