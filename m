Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093901;
	b=3JQePeMzjxvp+EYEvLDYnI9L5QwMnsQORjXbB0XdxRc7TQa/ZnzvrnPveKePNjVjIwQf
	 uOAARhP86ByyCQ5FHZXGPiQ7RG8QEBSKgA1FPZBUt7MDQHIYPyzZgQjYxRQxtroZE2nSS
	 B7l+6lLdY71ioMXSKRS9N9BWPGhyPJxhdxI1arR3SjObHzpXwiJ6bwj7ZWtV+RNVksWoz
	 SfI+7P7x9PMMY7HtjCHSDRdvR/QCz2q2yGAoBb5HnGy+UP4LJd7i+iTUYcgngPqjukWwp
	 PkbelIujDYQISkzMQN4MrpDDOHZn47/b6fxCTOycqMLdJRU0aSfmeJyLdFHl1DLKMxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i0yudmo6VUVU85MjSM6weznmhVRKi2zeK7oy8nDu0HA=;
	b=0oM2Mz+6pqjqBz6QWk3N6+GaL7Q6CXo1CpI1ot4YpHgQGkCte30ucxVFihI5dhVEMgwy
	 QMWkP5iRGa8X8KtUxEsnQQWlNA+pGx0FHMCUUF8xmP6MRsYyUZ82fCRqQy5V7UOXKCwTO
	 iJEeO7xbEggcFayFi/bRBB50cTS3vYzKJk7uwE/lghGTu3Ku2OPfbXqDomwWm0beGg5T4
	 SenTxrfXwq97cveOgn4o1PQtq9hEIaMKhYo/qmZsk515mIkMN1egPelRzcWfJcqx1tRDZ
	 Ax9ECwmrAPfjbsl6BCuc6hm+kVgK4ufRFrXfVxlnSah/tYJYD/oy1sujzWLqwnxDDbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6u5XQJI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=crtGYp+L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7276E606A323
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 09:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7276E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6u5XQJI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=crtGYp+L
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gtF0633884
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 09:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i0yudmo6VUV
	U85MjSM6weznmhVRKi2zeK7oy8nDu0HA=; b=A6u5XQJICbd6VxefZe0sFqhQnfz
	1cFns9YtPeN2RKesCu9lXgXMzucDrEshF0KjApXHqCNwHWj6dGjOlc5xld3a8H41
	e1HvS7A9OyLF+c7pF066AdeUM/bL+wKE7e61UmpsaBWBdtpdZ+Y4hI8FkpsJbpNA
	fkXw28nnQnJ0zgsRHSvWKgg7xP0Qc+k3c9aUDnI9j+oc5V67GsYkD8sb+spvE2Mx
	sN3DGtxIei0SHIC/LdDeBFmXPo8bFIKR44sSdacn6Grx0OOvR4swM9ejQ6Ro/5T4
	7FfW9mRSpqM8t6up33vUFFF1i8vXHVgGKcYUYRqEQNZUQh0Sd5cXVgZViJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smuta2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 09:38:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so773497185a.1
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793093900; x=1793698700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0yudmo6VUVU85MjSM6weznmhVRKi2zeK7oy8nDu0HA=;
        b=crtGYp+LmroFWe6hRFheAEXJPNV/slhfm86t8qxETGZ6tNtDxkabUwgQJ+icKX7LUu
         UNFfqtaP40raVawgfW0JP0N7S59qRNSzV6ut00vek+zp3AXTq1SuYuN5yqlefQz0CjRw
         c/YDJ/tBoMyIcRXEvIlbTIu0HIfCB9fqHabw4DhgsKj0GiLUUh6datzYoKljII06fk0u
         ZMgYGqsDIAdR6kM9opopvBw76yvbI20DLK2B50srhgpynYkwTw/iDoLXJ+NENwUSQlFX
         qEq5dSOTQpWrDsliJTGdHrAA/73AHCSLAW3FdzZZjhld4Nxcmc4XKCcI+hRnA1jMh/Kh
         pfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093900; x=1793698700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i0yudmo6VUVU85MjSM6weznmhVRKi2zeK7oy8nDu0HA=;
        b=SEc9s2zRTmjRt8ypbrQVZPE7PN4fLNIT39qi7j70wGdAh0dcyFQJwdiKr2VpZGk8FZ
         9lWfXMH6WRi9eB39saWct98zO/Nj+WnlbVNud2knCeODdNtB+Yqp5sW4yv83l8bHdFNa
         vAan4pMfwRv3exqZWle8nzXZ3CvETfou87euDv+hu/cjQrRtxFR9KTjIjE4FBTenBId9
         Xr4Y7C2wXNWC61wzKiY799Y2GB9NwkUh34kI5v+CFui8yTK8ddb4NLIAWwtJMap0c6m8
         LBw7DnuUGOdbLYfr/ntAbEWV4daRje2+A67udhACxjb4Pa6DkhI4Wm6wiZ7A8DqufzrJ
         op3A==
X-Forwarded-Encrypted: i=1; AKwUvBzwqMBg65wjrJ/vpPljDpkTGtVWLhDDzn0FA+AfbpeOryWlosdjMtzTdvAZJ5R6QjXK27OScxyt4AMKZg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4qowKNmB3mE5oxYk799h5maC5ch2ZZ1EJtHSCwmNqdQlEukj+
	5As+uUlrEsklSQNK3BSeX8wS0cOPftHSL7FAciyXhUrnaCXPaG0PiLVk44xzHzUkbvgtDhGd1jT
	MiesoHLtSfbBEKRx5trZ6jcampuVTLA63QCfzJ56zQIMmh4Ew9a55/fCxGxwPOBoPiA==
X-Gm-Gg: AYBFou1YKI2XxjUtVJdKsnt20oIfQbi9wbDGYP/6PV0pO0+0B+esufraCWrZXW54eDJ
	op1tYMYI60wRoKR9OyllymSnLLXvOTSGgNPXSRe0+MXYfTKb/e16aF4xrQZgleeak3jUGeMQKA9
	+1ZhoJ2ohPX8WAsG08MtAN0jyQ2UDD9wXJE+l2pssoC847UuDZbLZzxc23iQI+soBEu3gWaUYZp
	7p9lww66ycI5mQWj0X3A5zNl3SC6leSoqKkccqIMYxw3fDTs0rxXEvmS7eLAdz3zyJim/sroDNX
	tRmflubRr9j71yQb4zu/gJShKP1jQC2M0Rs1XLAkTJHeG5A+I6x+JtknpxllIx0ZdmqIZ/R5Z7e
	VLJVLFno18ZKxy9nohHWgfhbn
X-Received: by 2002:a05:620a:440d:b0:93e:fa30:f1dd with SMTP id af79cd13be357-940ef999e05mr1366064985a.70.1793093899791;
        Tue, 27 Oct 2026 02:38:19 -0700 (PDT)
X-Received: by 2002:a05:620a:440d:b0:93e:fa30:f1dd with SMTP id af79cd13be357-940ef999e05mr1366063485a.70.1793093899376;
        Tue, 27 Oct 2026 02:38:19 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm264678145e9.11.2026.10.27.02.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:38:18 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: atanas.filipov@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] media: qcom: camss: share VFE clock sources by the highest rate
Date: Tue, 27 Oct 2026 11:38:15 +0200
Message-Id: <20261027091922.3290180-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bdd89ef0-9cb5-4926-a8ec-92d8a4d78738@linaro.org>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com> <20261026133726.3249235-5-atanas.filipov@oss.qualcomm.com> <CAFEp6-29k2AoJq1+Rv8a3GE8Da1sZ4E9-RUd4ez-EwOajx0RTA@mail.gmail.com> <bdd89ef0-9cb5-4926-a8ec-92d8a4d78738@linaro.org>
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
X-Proofpoint-ORIG-GUID: DBiyO7W1IB9famX3b0YjGNbEPZDUZyHU
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6ae0710c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=G79TLdkEATUW0zZw2xIA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: DBiyO7W1IB9famX3b0YjGNbEPZDUZyHU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX+K/3QGt0lDPv
 9WM+RTrg7u4Gmfv9uscvYlp3ru6sHGkvom9wK+IbrxL5lsbjmM8cGWtfFW9r6+GqD7hOODCoZrn
 jBIqkW2HPaMUXu5WitkssJZg8hh58+E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX03SpgmFcyLKH
 jTKpfWazoWW+TFb8QbAkIobsCC2RrohqTPB4dDuOrzmcbTSmOwY/LCSfcF6V3OEsyM3WCW+cPYS
 JLYgFwYQvZo9o3L8GXkpEAHRozXC/5liQ9tCAF+fSWC6k9T4RqdX7D94J2hpKfwS6EfGHTcSOzI
 ec04yrGwRskdg/nJ7nxv5oUxARaGtDpgBeLNs6xfdUctpW8DV2udyMNDzkUG3mS0ggYjl0u1I9Y
 ud9vaeBdCcBBunKG7OD42/2SwP44QNFi2F7bnbuQLBj0lon+iMM0d9ICfLW5xXMzRdI8VgICfkF
 JMx7v5nPeM/9vlY6YnmU/v4rIZIG+q1Yuv1fPKE5M/l+ukzHnXhhPXXBFBimgWbIKAonQ8iGmRD
 zTx1Z4cXB7Gj/7uk+3KKl++X3a6fRGqQOrrFr7RDiBnW6sy5boLnso8sJTvn4pIitGAKO4nhVOb
 i8dsS+6mwjd0ldw5NYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270038

On 26/10/2026 14:38, Bryan O'Donoghue wrote:
> On 26/10/2026 14:35, Loic Poulain wrote:
>> Why? I think it would make sense to use it unconditionally.
>
> Yeah, my intention suggesting this wasn't to have it booled off into sm8250.
>
> Also would be grateful if you'd add Suggested-by:

I limited it to SM8250 only because that is the SoC I tested on. Will
do in v4: the rate ranges are used on all SoCs, the vfe_clock_ranges
flag is dropped, and Suggested-by: Bryan O'Donoghue is added.

Regards,
Atanas
