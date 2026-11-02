Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611713;
	b=gltI+4ydAZWD5EoGSAA35xMDUGJMkpHEfH+gfgHTCADjF0edCl8V8I3ZkxjoykyJGqx7
	 Ol37aOViXhix/pMNlEgaKwzgAH4BvohWwe/P/4oTDSdQeNhrHcuLg07EJTgiLQaIwqnab
	 QIJM7jCR7zjk+3XNJGX0+a+89bRLkWBvdjzMOGV7p7do+Go+MNNvw/ltJhNidDGzdE6pK
	 L+m7tJ09utHGg7x6XDY0mE+jK9hnWR249laprryzeWRQY+Qwqltdtsq7XCXQ6OlVzjaGI
	 8+ttXX9uD5iyffps8kaLv2JuBCTsWthA4Sju6C5Hei2eFY08PqyMMaF0oH3wkG/jkQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bcAaWAAo29UXjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=;
	b=qVyP6crB1o4TWyKLwMSQ744HIMFqQKrTtnC85EedvzHByWC7P748fd9K4nNddw32ZJkD
	 Ef+iRPW71Dlvnl5lJJH5f/eLBfS0qiXgvSS7IiMj2ELrHeweLBKdTrK6bfZMPBc/Of9RH
	 4zy4GpQDpbc8U4kZfjAz3myrRIpE5qxSnwI9j4Oyc8GU0Diohuk27GBKFs/HdWVW+l+7t
	 kssUTGUWiMTlMRkZoJbi+sgDA+WHEcog0u7kbHQLlNYyb1CVHO94py9J8mXXrE+Z8shkR
	 Bs37MBvXMByVCnlkAqG92SM8oxTDI9HTPMJrrLrnjx8RVQypeo8pvUQRZaw5Lzy/TVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X8s1xPRn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UcVLgZ9T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6DA606A327
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 09:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F6DA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X8s1xPRn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UcVLgZ9T
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMof2880846
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 09:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bcAaWAAo29U
	XjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=; b=X8s1xPRnEUjh4VACQths5mr/jZ2
	+M5KMt5X812eVjoFa/aQIybk9po3wOmN9U/JFiupJ6T4YpD+BO942o4fIzRrIXe7
	GdRNCPNNlh36tULSxUBT499UEhDW9wYY76rpssIf0kyu1NT37P3lcFiiphBFQb29
	i8gnTKw+9TGxDjFWdgTlKkj/M94y0GEK0eq2sscr5vgrUqNBdBU/UP8OaKqZQcPP
	3Y0n4bTpSPXG+lZybYWNpT1YCGDvOeaNoOXnN4WXhx3PZuCrLan673vYDD9x50AW
	Oq5NvkosY2y2YaBC/FlCowXtfyYaQXEEcBYvc/HOJCaa+ICC6bFlLpG9vOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrg4mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:28:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so453078185a.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 01:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793611712; x=1794216512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcAaWAAo29UXjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=;
        b=UcVLgZ9TGu1T/Cr8wzochSuGG+ECdSLQqkulavFVT8snQ5baPqdcTB3npdXs6gWREM
         g3EWQshi/Ut8Jn7x/0xcoSYi7euZNtru3cX88cbqDpyBOaWM34GJKabHvXJXUaobPM9i
         yOcmlm39hfXPbCBvLhO7X5i9ekD/JevmH7gdnNmMlfCRGGrscQt2Gdb6PBUTqdifGiMb
         zZ9MALaFV2arZOYPvDTzXUmZ9YpOoQO1U7DyEOdNGDZMiudRqdnwtzHl5Dh/vsfcymmJ
         6lqJ5oTzL8Gaz0vgaSEhvWw1Yh8OpPYoFUFvQCqWqvGY06UZjjpJLw7wKTF8xo79eBTl
         ICEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611712; x=1794216512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bcAaWAAo29UXjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=;
        b=kKO//BBDe+oA4DkvYQkYRvwoIovL9QUKWVkYA0floKFpbkRk8S/qa0TS0RrMxQEGrq
         ELlTEXhbHH+hFpXsSRe3xnzJy13lUucCfdM5bybbTGtqNnGDYXGZC/9INyu5It4DgD3y
         Us3o997NRae41k+bXJ/3qqHl564QyhFItcYHnl56YARkAVEYGKW8oOfPhDAT2l/xwjQA
         xWuQxX2KJfKhUuIdD3TKnqRzYGTcnb+Wh24GYlBuhl0C9csLRMwhDS5KYMsbGYPFqxCu
         xSVmpvrDoO6QdFZ/DereU3Mojbls89hEhdJY8N2QqmTWoN7W/4zzJE2CwUjl5V5n16zK
         t+rA==
X-Forwarded-Encrypted: i=1; AKwUvBzly/x0mWJzBzMvmh6RyHb41xKlqD5GL2rCMsh0qEqv3CsC82DpFDWuIKOX1U+xaTs8EsbiL3VztwhPSg==@vger.kernel.org
X-Gm-Message-State: AFq9FYID2AQ1h/kqz0524ZKV/qLdTEAnGMEw7NMGwOp+d/copPlzF5Qn
	0CEq2a+skI+K6M1vUkL4MSRTqndgkVC24eAh4PfU6qo/NfmQl8A6RNT404b1tcczNmwltnpp5Bm
	gIqcwmv47ltFcrOgWLf5Cvwve5ntPinWVJgcXx/sc/VA36tKdrW+F4jEhKHKwj6WZHQ==
X-Gm-Gg: AYBFou1cJ2588NqpzuHrWKO6NptPVBCliCeH1TwgTcTpt7gHsN9tHqu4vF94YdQlcDV
	nQYQONXdHA1kvgnLAveggvgGS6Lc67I23GNKu2V57UfcORusiIV8oqqx/lu/5wHCxIHuCMrv3XJ
	4ckeK9G9F5o8ewjXWLtNVKmKi1bllpvIffimN5jhJz47D2AcYZmSIzAdcPyWqEYs73MKidmqA4x
	HaLXmdTIjh0gYiAROl7nMXQbIeZOVBmV4f3ur7YZYU1IlZxF+jVyKbEzNFYykt9RvYrLLOaX6fH
	efqnqkONGxww+GimOpinwbxuZyXV58HPUwLF5Jd4NfPx+jJGYCPZ9FQXKNmYXr7SIdnbegfQ7FF
	oXjnVRGq0WHMr/YMEYcUL/UOm6fEx5SiX5V0oaDxPvDCLGMULlcbHdYvkaZLOR7zlnqBvTMnfww
	==
X-Received: by 2002:a05:620a:3188:b0:93f:2ab9:728c with SMTP id af79cd13be357-94421758732mr1585044685a.71.1793611711484;
        Mon, 02 Nov 2026 01:28:31 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:93f:2ab9:728c with SMTP id af79cd13be357-94421758732mr1585041585a.71.1793611710931;
        Mon, 02 Nov 2026 01:28:30 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm22171893f8f.3.2026.11.02.01.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:28:29 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: atanas.filipov@oss.qualcomm.com,
        "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Mon,  2 Nov 2026 11:28:28 +0200
Message-Id: <20261102092828.3728247-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4f7tyzvt2ojfmkneoaviegk3xbt2gegp3yoei57rzijcxkrlyp@b32nycxqybyj>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com> <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com> <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l> <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com> <2rtrk7tsquxekqhk7tsiomjnfzc3xfqg574cbw2m5b4ui4ovt6@2oxme5w4wsqy> <31db3de6-34a2-4ccb-af61-043f56d8f86b@oss.qualcomm.com> <4f7tyzvt2ojfmkneoaviegk3xbt2gegp3yoei57rzijcxkrlyp@b32nycxqybyj>
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
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae857c0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=MqBAt_2VOQeXeQd1tQ8A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 9ZFk6_r5doeboFoZA2cFVlayhlkvnl_3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfXw1io2tI/+/we
 eH8/K6asi0BJbEcVfEDdwIbiHEjIs3yIhG5142ifzFLXobl2sON2V6/IRzSX2t7F47UCdjn+cY0
 Py4noGRIDV2CS5hrPyLtHCQeU/J76kM=
X-Proofpoint-ORIG-GUID: 9ZFk6_r5doeboFoZA2cFVlayhlkvnl_3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX4xLE7P/xOxmv
 3nvtuhxYYBMW1aSRco+j+ufP2oh6zbh46p54V4rGbz20DFUHBFH+Z/Z0Em0YwsHB5JMehivRhw+
 KEQc5s8MByyUm8FLuZ9bhrgkDBWMs7N2BPjsB23Sow07nZKKEiqU4ER512JTdlcx2nldsubYFrg
 uMiObI7LNsK91mEXYo5QFi7q5hxvK1iIT4aFTrwPxJunOyGLQV65tTzSLdsfYT0XG5mX4EmV2D7
 YqAfXctg6ZJ3Q/YjmjLzJNFtQx3D4pq3u+Pvknu5gr8nfI1V3cUzqsIdbOfqFfz+QBg80ispWgE
 49uTaIUkLjAYr2JmNdjtttLtGLxkk6fNJZCrLS9hw58RaTtEtWsR/Kj9+f83e3qQGv1E/5xoAQp
 GpLtCKLfU1f+uTnqTUpYJaalPeusMyIpC8dIjOID0pXtOgM9f7+PN3ABRGL99pQyNgfmxDUxJ3H
 L/NAWut3HBI5gqgjH0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020037

On Fri, Aug 21, 2026 at 12:36:26AM +0300, Dmitry Baryshkov wrote:
> This will be true if:
> - MMCX is a parent of the TITAN_TOP_GDSC (in Linux kernel)
> - the driver casts the vote on the TITAN_TOP_GDSC using the opp tables.

Both hold for v7:

 - camcc-sm8250 attaches MMCX and registers TITAN_TOP_GDSC as its
   subdomain, so a performance state set on TITAN_TOP_GDSC reaches
   MMCX unchanged.
 - v7 adds required-opps to every JPEG OPP entry (min_svs to turbo),
   so dev_pm_opp_set_rate() votes the MMCX level through the single
   TITAN_TOP_GDSC power domain.

> Checking the 4.19 kernel. cam_cc_jpeg_clk_src casts votes on the vdd_mm
> (MMCX) power domain, while its parents (pll0, pll2) cast votes on
> vdd_mx (MX) power domain. Note, that frequencies used by those clocks do
> not match, so we need separate entries at each of the corners.

Agreed that the PLLs need MX. Upstream nothing votes MX for them
today: the camcc-sm8250 binding and DT describe MMCX only, and the
rpmhpd MMCX domain on SM8250 has no MX parent. On SM8450 and later
the camcc node carries MXC next to MMCX.

Since MX feeds the camcc PLLs, which every camera consumer shares, I
think that vote belongs to the camcc-sm8250 clock controller rather
than to the jpeg-encoder node, so v7 keeps TITAN_TOP_GDSC as the only
power domain of the JPEG node. Does that work for you?

--
Best regards,
Atanas
