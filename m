Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020721;
	b=m6bfoA9imz5c1oTqyS1zJqkM4kSQ6SREWm6AmHsltgzf2U2bd/m/IPnB6nHdBGtOAjiu
	 w2YKS0UemiD7eEsrbHgtKiU+5yNDpXGChEcUob/qTJ8lJpdOR8hPf78NEv3o52e8WKu/q
	 J1nHohWWDTK27v2nt0S+uGMt4XsghtEcoN4uNTaeELYZDGdKuH2orXX1w9u6s0WtHXcGW
	 da3m1QZQBhQwkllC8BKwmTAbuJfiAAekIXu9Qxtx2dN8cOdq6qGog0smb/0RoLI6MCPVF
	 ezl6LZXOxX8+F2+AEPRhJeug0J/X4rDZu7Fvfyhtqn58P568kYBmeO1H6wqGcpUroKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020721;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=d1ntf/q0XoOvro2JpKmW8goo34C/1E6I72Zm2anXLS4=;
	b=l1Rg/O6392FMhwnYJWkGY6XaEqtQF1uhEpK0c/xodKYvLMk9E+sVu9BQwj3Tml6YkyNy
	 tAHwBsDuHeeOWz9thgNRQwTfgplNsq6qTgF+sg30ZrUeOyjejCYXI0RAYoJn8W0DyUHQ/
	 jgod4mHtyyaSnbYPvA9xUao66jyAHAgmK6J1wMlDxaRnsYUBNYhHJodO3lqB5R7L1Zoi7
	 CUbUDmpKeVTdziRcZaJ55UyiAQBzM+nxI9MDqBZgJlfTQ3rtPuuam2W9eeAJylxZFGIaQ
	 6MO99AShPTo/M8EzBl+KgjUWhqnocKcX2DdsMzHqFT1ZDaUw3XvG1e+g3JQvvL5mVGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VqXfStaP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dgR6STkw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6E2606A31F
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F6E2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VqXfStaP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dgR6STkw
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt4IS2169331
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=d1ntf/q0XoO
	vro2JpKmW8goo34C/1E6I72Zm2anXLS4=; b=VqXfStaP0M0uiyuTOYe6IT+O1SS
	h0IofaVGjPN3WKApu6ku71FGlGyYiQtLlxhNmk2xEIQlsivOZRSo5DEbEW9I/xtt
	Ns6uFJyMtN8p15wPOku4AgkQBXoLgNhdQE5zq9k+oRDTDwhwTbR6lTNEkakJpzBu
	t49gbhuM4IcoDGqzyU/yf3rskIZFsWLLnX7DgTfGk3HWf9SsYZJMTGOhsRg55ay7
	zJjFXXV9de2hdgLJiodkSFm/l+JBh2UpH9cDujJT19U5ocnflkixYQgFspeuKecC
	5kamEJ8/BzMGsYRMhyxrMjZmtuaWbC/4QKvh/B9olben7C0DxcXfkYey2IA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60xcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:18:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso743729885a.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020719; x=1793625519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1ntf/q0XoOvro2JpKmW8goo34C/1E6I72Zm2anXLS4=;
        b=dgR6STkwpFy622G8ukK+Zp+OVPfl/nsil7i9XGoOXQgxhko6IrtArEWPqHTTOLS1rJ
         Zb+whEVEDM2YxEgfwHbv/SD25UmrOuXelRYb2uf07qUUkhWpdtq5I83+uKWKPWJ67SV/
         4KuyvQM4thc5nZwW2EDXMK5gnTqG+XKG/YgZfadJNhtvuA8qGsl9Khp+c480I25QMvxn
         zWsjUYehz0xtSJmOXWP6rmmHk7maI5raYgrS0bcqX9v9NFsVQQSqPh3vZUMSDcHcTvU6
         WF9zBmvmkip1jzRzdKGQsf9zNdh5Y/OpAIe5WXzebbSqAdG2HB68DcprU7GuP1tt3azC
         LagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020719; x=1793625519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1ntf/q0XoOvro2JpKmW8goo34C/1E6I72Zm2anXLS4=;
        b=PwgWSJ0TqG/9jeCY++KPgU06a3mIqTUGEr3Kql1J27gZVfBQ9puI4kidVLnB9MtLK8
         34ZBoDIwe0UaWGJaNH3RlmWETZ4nfVBmUV7jcakwtKeOJS/+mNHlxw/H0VpBdwwtPMhh
         sLpdDo6HgSDEebIixCE//SbqcC0bbjNuMQUK3jtHUZMRxTsdaGyH3Hz9zgsYi1UkXIy9
         ZIEkVNgFSNwlPVoLxtbfys1A2Q9piUbZIyil64m7HMoSfT0WpCzrMxqIuizWsmLa98hY
         MscyxKU67MHjmtF5iE3uANwdMcbrdEMVO0Zk3dOwbQkgaY0xHFoVmDOaOihBEzPFW8ke
         t1pA==
X-Forwarded-Encrypted: i=1; AKwUvBwOraUmyJl+dcp9fx3N3yFlzG4uoB++XD/hXXwv28Sqbe7b3BGRVEJoN0O40VSa3b0NmYM5q8muCB+poQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJFIDpcFpH0ZoDb6w+Xf2C/vLOP/reOHVhBrDH19gqzypT4f1L7
	dPoFKojrm3Tqzl59Ygru6Q4rfifT0kyx7JG19I6kfAU4FQUKEptaC+D+4YZBH55G7BbFu4zopib
	2jbzu/RYnfb0m1EiKCc91o77vO2Tvfxm6z7jF2vE3uCxD5K9s2FiL5zkXiDmzZCdJ0w==
X-Gm-Gg: AYBFou2srnEDlZnwPNDKGA7u8Dihoo+vPzFc8m7bvajvvCxIpIq5ABoRoMn2vPl00JR
	iiI/8EPCscZO/o34kh3Eg5HR/aW6OWD9WbISAQlQf7HRkvwUp3wKErTWHFtDubfW4QDUvAnvFF/
	E7cTizbizw9Fz1kENNCxYN+6MMfDow9euB5agNAJR7QE/Jlxfek+li78FSDNbO97f+/8WJoB8uE
	36sB/nwiJp1GrXhhcTK0KUTnBReTOLLzxDMOuBHeK9aw/QdFDjlZAqc8Ae7F9JhRG4jBvCOUavT
	6nBDysZATBe2uw6EbBqNwfBjiXnY+hiY2ylb8lIXf/DcQWH8K39RUAyTYuYPsNcgm4KDduPrynx
	5CgETnGILzKmynP3lMKXfwNEB
X-Received: by 2002:a05:620a:4ef:b0:943:e872:f521 with SMTP id af79cd13be357-943e872f5bdmr325825085a.9.1793020718732;
        Mon, 26 Oct 2026 06:18:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4ef:b0:943:e872:f521 with SMTP id af79cd13be357-943e872f5bdmr325821385a.9.1793020718181;
        Mon, 26 Oct 2026 06:18:38 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm158170775e9.2.2026.10.26.06.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:18:37 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] media: qcom: camss: share VFE clock sources by the highest rate
Date: Mon, 26 Oct 2026 15:18:32 +0200
Message-Id: <20261026131834.3247963-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4d01af69-0942-47a8-a1cc-be52f520184d@nxsw.ie>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-5-atanas.filipov@oss.qualcomm.com> <4d01af69-0942-47a8-a1cc-be52f520184d@nxsw.ie>
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
X-Proofpoint-GUID: FH4TDRdyciimvgWOs2z69eFp1AGg4DpH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX4kexu8qqjfUk
 JPYrk56eGKd/HI14fJ9R89O3GT2MoQwejViXmy2r2uHIMsIi6VYHidKYdDSaYpQyk1Z1uc3QIaw
 kkzIwbN+1PUBTo5rPjgF1jsw9v8zvutl24xV0vWbGukQlNTZsrUHNcTyBcdnelsvKZueLcqt28s
 Ex+IgmURC/6SN4j3LW/gy3kLdk8++ZJbPNfgA3T4Gyj5qxdOCAAZlRw2YYy/9NsCUktjHWii6jZ
 fHYqu+n1ZD6QoqkONf30V3Zni5+8vX2/Jb266pjXXX+X1APdcrs6qQ1s7M+n1d+1f+Nkydq8N+2
 e0zqIXMnP+rerabJiFSoIFhw17QNybmmXMhB7cg3fPTnH7gBRtaWuyUXglpm9U6X8jsx7Al3sPT
 NN27YOKRAzNHcm9f7U0OzW0HyAzUHHqs1Q3B5591sSylbzLTl6LeUNRg/sWEiB/Bgkz1KTw9Bbb
 H27NCVr2W5dCNGHRWWQ==
X-Proofpoint-ORIG-GUID: FH4TDRdyciimvgWOs2z69eFp1AGg4DpH
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf532f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=cPx-3dMFXJ-tvbuS-X4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX5p2gxfpyn9sW
 o14ryFUHzoh35e/kCTBlV70IxegwqWznLQHrYC7Y6yocoxXxO41dLxKhRgdQ0u3icXJ0yYxu/l2
 XEB53wLxI6oO91djrJO3kFor+8vFYvE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052

On 26/10/2026 09:13, Bryan O'Donoghue wrote:
> clk_set_rate_range() is a CCF provided aggregator which will allow a VFE
> or another consumer of the same clock to set an effective floor -
> without having a driver-specific voting framework.
[...]
> On release, relax the range first and then clk_set_rate() to the lowest
> listed rate explicitly.

Agreed, v3 will replace the clock domains with clk_set_rate_range(). The
VFE will set its rate as a floor in vfe_get(); in vfe_put() it will drop
the floor and set the lowest listed rate rounded with clk_round_rate(),
so that the result stays within the floors of the other VFEs.

Tested on RB5 with two concurrent streams on VFE0/VFE1 and on the two
VFE Lite: the shared vfe_lite and camnoc_axi clocks stay at the highest
floor while both stream and drop to the remaining one when one stops.

The floors are aggregated per clock only. The AREG clocks of VFE0 and
VFE1 are two clocks fed by the fast AHB source, so the floor of one
does not protect the other, see 5/6.

Regards,
Atanas
