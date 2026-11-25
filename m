Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631030;
	b=PBHXamiG0c+ZRt6Rx1QZDkBKjBZtfrXgy/QPNw41yW37vUhgRbRDUnZVjLU10QqC3vrh
	 NShaw7xN0m0K6Vl8qlmjtyg1jYuVH3OaFNhXtc9Q+afaC3Plxw3Vz8mK6swEpZUegT/4P
	 Kwr2VvsCWB4fClpFT5+fmNMx45hL3QBhkmKVPLSnyD2j/eE9Qfya3pr96tRvUc5WkurUA
	 HeIJrUk5rzLCn86IPUAeijtPcuGwIexXlcV/bPD1wdlBXUaqqKQ+l/ZctkLmHVplg1FOP
	 To63Ci3wQe5gEY9bcp0FreziYxj9Wg5i5RHlPHi3u/nY6RsjQHpksrTvhWhc2xU/lUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eH179ZcdqoRpZcv5aMoNRNsFZzTXYPMc4UPUUXcVolg=;
	b=e2DQahFqkka078ASgJv+hvGwlQKduzQTsTr8Bb8smUOcp0nIn+uaypvjxEtMzoT/yOJ/
	 o+M7AnMHpd72jDWwyK/Y2vr3AuPR8h0YzM1y3aj3iaR5LEcc0IqCQi0Szqc8Uk2r9vYXZ
	 02TIvwFqeOuOpd9C55vNOnkfoIcRZAsvTrH4KTQgKri1wUbU2H0dt3ch1mbAMhpOLKT+Y
	 tzgwtsPssPpgfYgVKTT2WP1M4mcpkFoNW0cwDTyeAIwVamSY7prwm90ZPj6c98O4zQpyD
	 pNsEpfiNmXQugc0slFnKCjfYNrwXGweiqazxhiuybptWJobTxvt1DUSAh+dykpSx23g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y92po+9b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZFcsTkng;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C982606A33C
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C982606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y92po+9b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZFcsTkng
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQBN71670926
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eH179ZcdqoR
	pZcv5aMoNRNsFZzTXYPMc4UPUUXcVolg=; b=Y92po+9bythQsJKX/6bAf3U2/bs
	5QZhvFlRABZdA6PNHjQgVEel31cMrHaiGqTze/cqMNJDuDkdnVKE/Ub5nyhVWEF6
	8HLtu8wxaDMj8HxbDZHNesYgtM0D9uKJI4PZwxMJy4XxTPa+/WmUKwa7eKUp+ues
	znRz5TuwS5GIsQQ2pZ8gluORLTgGw5Zl0Cokj9p8jjObzDZth/XgxqXv3YY0PiEu
	T/wYv0BCDoo/QB+QaTspaXEn7/58wVD63WZQwz45Bvet3L22OEsAB3zUFhb+8/YC
	o+J97CUllSQ6bfPqLzJt8vrd5lA9LXbz/2U1J7lQFMYwDSLUeCeL8yxIYvg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62varj6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f2fafeaso691121885a.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631027; x=1796235827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eH179ZcdqoRpZcv5aMoNRNsFZzTXYPMc4UPUUXcVolg=;
        b=ZFcsTkngQNU7yA7/Jp/Q+/yda2rgFyix5I+o0PyHI0zh2MmUD/CAsjv0OsD0odtzyF
         fWhWSRdWXY4g7O0jpV9BBpzw0SyifD2+BrafbzdoekWa8zYiUulO8vN9XoCHFL5EXdrK
         dj0iOTMRdegPorU9xyp3Rp6c2bvqf0NgqLsh2YMGM6utKNMJPjXoXspd2/rFcjQ6pGNj
         hs5C6Tjq1f6Uy/PM3DTSFN2yjofnZ15jg+/PhaAmI3OuGUXquNTcrq0iaLOTmwBnJVOJ
         P0SWxPZEd3LCU42+gSXYhV7V7YT9KVRc0sPxM497G0rVUNQLiiSyKj1pgOzkOMZE+aYw
         HNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631027; x=1796235827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eH179ZcdqoRpZcv5aMoNRNsFZzTXYPMc4UPUUXcVolg=;
        b=tnOlm0ET9XnE2q8SeV/bVQ4k7wt6u+Fj+gLJlQrsqWEMk9x+uRr9+8p6DvxY+C2PtW
         sMzgqbotWO/rM6+kpUNcU04+ehOM6OwFRc53lln0rHX60atVCvK1wprf0z6siUU+C4tn
         uNh2xprN1FvM3S+gXemA503d2i7lRPHQufBAwa79iaAlz5lx5qd8ZRmy6ZojTLvU3rWW
         XB9JvRecTpxBvU8uJV/GzGjqXH07AI3AWO1wBdM1qQJavVdaHX0wj0LcX1yScwo2K0cB
         1Fc3dn5m0YO0SzvdTykGmGCWgElpTiROBngR94VyhcKqxOMMwCmQ3oCKa5ePiHVaM57e
         ZvBw==
X-Forwarded-Encrypted: i=1; AL+hErGrmNws2/5U627zizVCYMn3SSuEdVqXSaBJH0K5Y+7sQ0ocx7rHhc7dMYXPIVBoCzOtu66NkMut7aIvEQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ySt0TcKSOI2rlL8UtEoSuuv9Qr2wOaAgBEkbPDdrV2Ch35rfJ
	N5dYNqrMPWpipKDWRIXTlhKjrUW2InM9hPdEi6JlTrMKe23ghT6V2052R/SavGsD+8RA+7ZcqYH
	aMSXZmpYXw0GDNxY4dJbemfgRpIkm3cOrOtqXKgAzBP75gRDZVAAnqbuYj1dDfj23CA==
X-Gm-Gg: AZFdTZfiqO0M6505KzbZjpIX1MRlS9FsSpQVrC54NRrm3JID5syL8HJw6SYNugwOtGB
	HGBgusgzb5w24/OsjphNr1BeyF6NSVG5MAIL/14kvcBeTYtdH5fPS6injRfFbB1PjXN/H+J2Rre
	O3ZfyPgSoXnLxSOlSIXBxGixXTxDI6QN9vgYG8UQJMOYaXreCuIzkbkfS3HfiO/LDxGiLfgnATG
	T2s+fr3piA0OFsWQAI2hCFosa1jT51qeDKu0ey1kF1hV/zef88qk7CRmJJ8ymbAv2M6VJ6SnMLr
	6tmdndiA0jw5qI98O8N0EpYAleMKsCcmG5fUGgKTBMoY6QvQiCxg+j+N5qILOTLzNBSDPpchjrs
	01j5Gq71itRIsW7astWgN40AdEcAAG5uTLcXkJwReXRGAlsqhG26jxleHVJwy85tQ5v8H82YxV0
	yyfXzx
X-Received: by 2002:a05:620a:2685:b0:945:c4b9:3de2 with SMTP id af79cd13be357-949bab3e44bmr3196126785a.73.1795631027080;
        Wed, 25 Nov 2026 10:23:47 -0800 (PST)
X-Received: by 2002:a05:620a:2685:b0:945:c4b9:3de2 with SMTP id af79cd13be357-949bab3e44bmr3196122885a.73.1795631026642;
        Wed, 25 Nov 2026 10:23:46 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:46 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 03/12] media: qcom: camss: Add streams enable field to camss resources
Date: Wed, 25 Nov 2026 20:23:17 +0200
Message-Id: <20261125182326.2767771-4-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX7x1kO+jfir18
 wb028RT/gUCUARMe8mSzhViW1MyUJORToDVtA8mNRtcbY82yNm14mpUtZYVUPgHNTQfso/ZlLQn
 Hrgxcbb+fy3t2kVnyfPKXBBTogPRC2w=
X-Proofpoint-ORIG-GUID: 2dO8nhuIi9exten4G0dkz_YBz1m5rcYo
X-Proofpoint-GUID: 2dO8nhuIi9exten4G0dkz_YBz1m5rcYo
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b0727b4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=Zc0e2cZeo9r8mepgbREA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX0E/zPXJXvUeo
 9g9Y4DPOgkhgC7o5OAoPPsvPgXytbQF+ochZgcIEjOqJnRLIkgufQcFRLTnrexME0lUl3nOzp0W
 /TMtMpfzxoq/2OP9dSXKoaZDDrWXT/AsjePHuOJUkeH56MC1XjYlOdhoSRHdUFOubjGUjL5OQ/A
 J3R9HX0p8XfDmzNwg+TqgHr2dQvqucRjGn9D0maPFZZ8POYcjP3R7+fm7FkL54LJI6/XwbtxOx9
 6Pt5nqy1psr1MNlMKk62bsXfi8S9Gd0nno3Ks4w+VOB96Zks1Zcj1DllWqskRs3La1YLyI/6pfc
 ZdpFcgfAv3YCgKMkH1bBx3cOLlV2CT/TE4ivAOujmAOJIAPIh0QmIS12c3Nx1FdBQPgPSDlGSPd
 gcY8bAn37syVs9mVj/uwEY78naPByxZfyyZDEhAHdmByhj6/TgnZVvj0hkNMphWY33L537m0ma4
 Q1W7ywgGb4wT/MHeDnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

Add a per-SoC streams_enable field to struct camss_resources, used by
subsequent subdevices to select between the legacy s_stream()-based
pipeline and the V4L2 subdev streams API.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7564a7c46fa2..621ea2e3eba1 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -121,6 +121,7 @@ struct camss_resources {
 	const unsigned int tpg_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
+	const bool streams_enable;
 };
 
 struct camss {
-- 
2.34.1

