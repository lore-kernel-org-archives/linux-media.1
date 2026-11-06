Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953551;
	b=46C7FqUVagBykwQA9WEgqLu/bkO399sjN49kLzuvlJyMctncMMAqHllGMrJ5fBHPIchR
	 WmgoTAVUWHPH505kgYGLzpcB+OAmvXmD98otYMziINWkhq/u+cCEqs86R7qv0xRYfjHzO
	 4zR/3+rdaVzECIE49irl7XuFyB6qxrzIaQTmFg40TvndnyWthcF9TIwFs8QIbVSODish/
	 nr1RHK1Ktb+UHG+4tV6Jc1R95G6zh2ywjEC52Qc7XkkTAmTYkTGi/GBVB9aiFCFHx0sRk
	 x3nVtm/F2C7uLUAP5nn9zWaeo5bRVLjDgkyoqhp8A6LKCamcZf5b8VZZ3CASgjghA8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
	b=EWB3EKg3nK7TZhyxRF2P2N2fxNxMDlR20DtyLGa6eKIuO25glgCQ9N6BayuKeYAXpB5u
	 AEtj8YwHIrq7DiiY+VMZlek6aNwgv3Jl8OxIow/iYRy4vNK6tupF2VnuHbWKN5pt5FnK5
	 vbD318t2h1FUhbvRIvG3+R8T+q26pCtxAXVZyP108JyYbnoTfxLq3PAvfR9rTaVBAfXmy
	 LjqlKe2Yz6aZl6+GygaSMcCVkZXB+FJF/Ny3HH8jQCr6iGlIlq2o+95IAAkY11/wuVl1p
	 nzXEk4pfzLSkQ3AENXY9uZuedLtMvBihyMCxWOeOsPjFnGATh7tWbV9kNT2Dp+bDRhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mV4cBhnI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=is41yZcK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E641A606D822
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 08:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E641A606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mV4cBhnI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=is41yZcK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RFBl2334089
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 08:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JJCjzDhflBD
	eCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=; b=mV4cBhnI5f1bkIth55MkDV9fkvW
	GVKNJdR1cjKgXNLqy2Cto+za8lLqIqqeLBU83/iryod2JKUPtgmZhzPmjTWWZBwE
	G6nQADiLwDNtbFsSmMgD5tabzguqrcPkuyQBRIr5unVEgKLdOFb56/SlqwOU/p+A
	QA1LyLB/LhXUnpQU8PXaZ8KylyaZn+Ije0s4LaKLjl+aG0b3ORyAHHpoMnn9HO0N
	DoOch5cre74eBI0Vlzmn3vAqVCk4D/mCmsNmNUzXpeSF5UkQo0ozS19nnDppYduD
	oP8/o7EgnS2A6cl092FWDt3HC7JKsKIbbU31p/GdgIXpovLhqfue9nFT2Zg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p99x2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 08:25:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5364605e74bso2574171cf.3
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 00:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953544; x=1794558344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=is41yZcKlcVnkykHhVxctzLohW2pQrIZFY3onETvF5oT4mLbq7G1bqjqAwdL6mwTrE
         VohlwRoFYgxs16WLokF6tcgAmw2Mro3YqmK4TbSXUbjKWDxBSJE8lJ4T6T8CEvCmtw/l
         AcWj/KTlCp5uYuyHTRRpW4k9qYKXJVGLl/Uk5aGYHCtPJ2vM7DW7GJ16BIyoNYAX4TvR
         pHi791+Tz2DpBljxrbM8VZdwItsOAv0C6f5j1c2VMrEewPnAqn1Rxt25ycV9ew3+75ym
         BVNQYW1g8WSL4DNGzcAM4wm4UJUxTMpakhoaSH8tAsgZ8NeC5bjG7q1r7sImKCmNcvWG
         txlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953544; x=1794558344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=S+42gZ54X4uwwXewnUtUkYMNc+/s305LuXXKe1d7xtlIBlNZvfWzxWcCb7NQepewk9
         NO3cT2MdxxcZbsqZ6do4X4w1C64cMwIVaJ+TZkUThXhFXUr82lIvU73++MRw5k5ofqWP
         aJhYNQB9D8Aw9legrjxJXvUb03iS/f54K6VKZpQ2lxsf5GTKh7yvTAQuNwkJyB8aOUz6
         2pU9J7Sfb/jdYixNCTsqb0SBJAmLw3OOU2cvR+0I6rNtYaz2IeZthltEJkwXqI/hQ3lo
         oY0BNA5DLcVGvS7j7vwa5UUwh9V/LqYt1Pt5sRN5W/k98B8aQvm8aYKcliK0jHEYywL2
         gosw==
X-Gm-Message-State: APuU4Z9eTcRPEwtt8y9pOHs6Y5210nf4O5P9wkZsEUG8PHI+zUi70qbW
	75A+q6beac04c0/IYPmJ7TbAShlT/WA/jB1qD7U5SJSSAHb3vNTjpIJiLoL6UTgk7JEvhSVjtqa
	O3YM3lEI6UnP1+2Gk3noSEWI8Axg9OHf9jSFH7/ea/5p33LvuYpSbYD1hP8jOm4bLMZt65IN+cU
	jf
X-Gm-Gg: AYBFou3yW5ruw/OwAXr9962hf+7UxcsMmnxv5q2yImxHnSo7B4PpqWnAXteJHT7Cgvi
	Bs4Tka39g7a/FiA4OO3zwBA8kX/oapa17xF5lNAKm62akO+2X4dhwb6lGeOH93zwEBt5jYmJA/4
	KmdnpTt8+NpdBROFmmM6ubhsIyoJtBg5iItVO/oqM9dFMiIWAHv173h/70eYe4QNCt2+NA+c4wJ
	bc+hAIg1VtV8AW9ukhwOjhP4AmZVMxoqX1SN3jKXfFkCaiHulaKqK82GjXWDrpdEzxOiJX3gGD5
	UeWHXMp9fhL2HetgHxccksErXFSxgsXcLDPKj7lyPSnEFzDL/yqTVA/3OITGT1BqaThRI/3QNk9
	3FsYV9KpNOlsmlsVmBhT3B3Hd3f8a1mALLs/67FmGZaYnQDbTUxdoGe/ZQrWkznC8+QSYsmvwTg
	==
X-Received: by 2002:a05:620a:6c87:b0:945:f0ca:436a with SMTP id af79cd13be357-945f32ebe60mr248645985a.2.1793953544220;
        Fri, 06 Nov 2026 00:25:44 -0800 (PST)
X-Received: by 2002:a05:620a:6c87:b0:945:f0ca:436a with SMTP id af79cd13be357-945f32ebe60mr248643685a.2.1793953543833;
        Fri, 06 Nov 2026 00:25:43 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:42 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 8/8] arm64: dts: qcom: qcs6490-rb3gen2: Enable JPEG encoder
Date: Fri,  6 Nov 2026 10:25:22 +0200
Message-Id: <20261106082522.1448390-9-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: dYeO2KJV0_LLpDpeVDKKnfk9aNbU8e_4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXz2MLLIr/VMve
 jMzR6QSyL3FUdX3BDkbkli84V9gxuK9Y02BoMcxQj2Dgrml6Nnw5r+dAcsPB2QefV9xmCCW6Awx
 7bj+yn+PoothzmAuOnhMBuOoluQo2kvaq8z0I0WP6W+s4UtD6ayEm0yp9dj25EUlEp0DPwrjtBZ
 DDNDRIL3nBFcwK/hjAAuq3W70Ts2ld0B4JJ2bPkQpCUb0Uf+axEFeKiIy11so5UiYbcCgnqBDiL
 V/4g2am9fHflW/xXFJFcZ3W4UOko/+6HmGpSIrYNeR+okANWKm2/U3Hr37X7oOos8UWw9YI11Ri
 PKs7juPV0DAJIunTLLJAiJnVx2yifHBT2oWcH6sXTYt+AmXkE5x3APfdxGOFB5y4EpD99abkL9S
 C7NYk1P/JZlsV34Y970tBIeLyCCT0S5aigVqHRKKWfu/AM30Su5bm585TgrHej9Dlf3x9WmEg2Q
 unWP3h7eIr/7dfqzf1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX4Xtec2Cxw69O
 5JgX+g7gnoWcXs1mFKFGBhEI+yf3nPBAFG/qpKd3VZ4GlugMykegzzwBLtov52jDQ3Eb0Z9+LN0
 DFwaNayG2g4CkOy3/6DEFwtFCAP5v5A=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed8f09 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ciSP3Gwtf2YLaD0V-lgA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: dYeO2KJV0_LLpDpeVDKKnfk9aNbU8e_4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Enable the JPEG encoder on the RB3 Gen2 board.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a216..b96214758ce13 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -789,6 +789,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&jpeg_enc {
+	status = "okay";
+};
+
 &lpass_va_macro {
 	status = "okay";
 };
-- 
2.34.1

