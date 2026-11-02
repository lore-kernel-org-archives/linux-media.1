Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615516;
	b=3t/vJFrxOA+uIMv4t1UKd/JIojWnoySUThBm2xLX7/xheXCViuDmfXDL7BfryUR8Fbw3
	 vfQ7XohV05Enp62uYT6rQD1G1KDVhpQHGCoeEsjbUEuK/74SA88RPvj4e4BmK2oXGi5UY
	 bCP1MeadPilZEy1nGdQt+6t5kJAr3P9T0A5687AnRCQP8ArF9CXd3lOYsD+BzidVTllMz
	 Y+y95Im07mkFqDZcC3ngIcaOnKqsMc1IPsg/Ch6YNrInsGl7MLQzUL9l6dEaIGHVypw4M
	 6JFf7qX/j6CchmnpmQGk1j5Z8Jfr6zreAP0lQLWLn+lGf46wF2IvkyJAYxDc3phODdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615516;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uyXnqQWcaQLaj3tsaPz7FL4nVEjagE+Vxk26KQ/sNaU=;
	b=SSJVlqzCUGrmnGNn7amxeiz9ZNnXfMG0ecn9gOT9tzjwI7LcjoRreTekcGC1N74xu3Iw
	 tAinslpT45zmrQXNqLZGLuWGtWrBDoYPSy4jJ/iYDBtxukNVDcjD9Aalt3iUldAz8aJ8O
	 YcMHuUdubgidZ25XY0LdRmpkrHPw+V3+LLuAO1TYTwCpIhzTSGsXxp65hhKIuV7F2evK/
	 TuD/ohX97F+JByJpWD8rP/cu1nzz9VnR88xY8FngFu2zwX7nwV7ykWwP5gAtyQiB05mxB
	 beX80qmTcnLzmA2yKROeBb3g8IR3SqfID8jctB/BuljjW7DVPXwjwYqTo7zzER7QKng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CwHYaScC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKBEKybM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8A7606A327
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D8A7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CwHYaScC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKBEKybM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A3q93402983
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 10:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uyXnqQWcaQLaj3tsaPz7FL4n
	VEjagE+Vxk26KQ/sNaU=; b=CwHYaScCqnAktnLKbwefXAtcrQfw7DQxwntVIy4X
	aEg+V7GMxxJOVyNCMXFNgjoaC2UFXe9b26BiGb3/NQvylRFsZpwICCI3rQlWPqmL
	or1c4wrz0UcGTrI12QXfkujgHzJFf9P6r48vz7VaZ0FFr9PGge/W34hpgqZZ4UcF
	uxat+c5kD59iSk/jEbpIzD7Qjd+1nscDkDvADZM1c/mJQeYK8AFWF0sDsBgkwTjX
	/H7j9zlkVgcFk6N7q7ykac08RHUUEjEUr4PiSN5qrk7p+B3UwM+K4xEWlqz3mw2t
	UP0Ekpeu6LuloBMYLzBWTyHgIAKPLy2h5J0ICCrsNZh6Fw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8nx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 10:31:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so507905385a.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 02:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615514; x=1794220314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uyXnqQWcaQLaj3tsaPz7FL4nVEjagE+Vxk26KQ/sNaU=;
        b=kKBEKybMJJYWp6+wtf8NSp3eNTZ3ybd5ZS9dsuvhyikhgdfcwvo9BB/Nt1jREfn+1K
         sqzVx3C5NqDdaJe7z3SDnZisaRUGn53e1goDptvM9Ya5Ny63RlknGKNoSLtSiDVHp52U
         EgewAshOrkHnAehM0dCt+i+EhIzcLDWTxBMrbVQUC8uj6JsrHkGd+8r4W5/7rhocrc9j
         GxPBtblIm1hfbIKUBJkt4G5xoZvefp+oFX72dfUwZB2QuXlXbQvOGlMUoj3Ashs2+ij6
         wWuFMTIvCLurUhXEHVAfCLymnHWq+XXjx85Amnmmra/WIWFgBOecuRUqWh+gVdF/CMcw
         h+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615514; x=1794220314;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uyXnqQWcaQLaj3tsaPz7FL4nVEjagE+Vxk26KQ/sNaU=;
        b=gV40C9Ko5/6vPBJQu5jbMgDv4KJfWFd3i9w6ZakKXoJeFcDVbsNQ1LOh3WVokYIYoH
         L8NPvMPdtuUrivCI61L+6S5H4n+YrSWH2cAQcs+PCvu4YvDP1W1aJt006oKdylL4LcH5
         LHT9UNefcr7sNUPzdLwF8xVnRUe+ttacZ8KOy+Dv3DoSLb8tHyueVuRECYLliJb8ZcD9
         1VtKm6nCE5z0c/PQFZitmypRF0PFjN78G+wWWxgOP+oJKXRBjHNTpBrfY+S45SHaIui3
         Qq/dV8dpHGTl2DpQncHdnzHwAoETPIREDwurFsPsBTyEuWQyvUWuCo+M5hZLR3CfmGpf
         9Nqw==
X-Forwarded-Encrypted: i=1; AKwUvBxdZaQr2XbAnPejcTeQX8IUzplk4EYa3e+6Is7soHfknaSCpbN6VLwPPz4ziave8s0asE5Fu+qT+xg1Gw==@vger.kernel.org
X-Gm-Message-State: AFq9FYInqafJgFypILpza6taQwCwd+Mmo+W0ocatOnQjFN66TD0J2zpL
	vOkwIbjsjlgZBC6m9ip9kEVE4lCWDVl0TaXHBPI6m3ECF1FyRX2MHOrtFjhyLcHL8qp4kbSYCk0
	jCf0E3z+NuTIlrFeL1hYMLbF8Hl/GQ2/Ooe5ExFjKV7SCySao3HjjZVR7mKxZVvUQKA==
X-Gm-Gg: AYBFou0L66VIR9gLNeTGmry2+Rdd5ymde343SQRqf4bbdgQA7/bknRuzJNtclpRvcib
	UlFJeCo/fWWzuzcDKXM7nG8jM8ziW1iK2ZlTMuJwv6XkGouNdSbtY7cUANR40phk1u5VhPj/GWI
	jh6LOatWmBDu3hMgdFulJ2qUBbJSTOFxtUGw3qfSm05Am3o+ipFN6HP2qHcsAhitB260r/VStVC
	vl6XuVcloCmeWPe6xjPxdXxdwv8wHZcIMhU0nwW7wGx555xia7qEArTInGvGHeRqAqphq+l47jB
	l2zFyZSsf5XoUGQ1RWjgPmFev4QnReoMxjDoAwCBm8qG0dkvMylkIT4MyVQiyJcDseedR4riUD0
	Vkyvxzy9pPbPyBaJVPNSdzh0onuS67vcgTcYRhaPGOKZar0CqGb38jjXi9bWYR8/Q1c6NyWllRF
	1be22iYf75n4OhWaCuEpG0qtwsJYwHAmtJn9I6jVL784BiL2wv4xMh8A1MTQuI
X-Received: by 2002:a05:620a:a888:20b0:944:2201:2770 with SMTP id af79cd13be357-9442201292emr1020058185a.39.1793615513872;
        Mon, 02 Nov 2026 02:31:53 -0800 (PST)
X-Received: by 2002:a05:620a:a888:20b0:944:2201:2770 with SMTP id af79cd13be357-9442201292emr1020056385a.39.1793615513478;
        Mon, 02 Nov 2026 02:31:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acd1145963sm3142181fa.37.2026.11.02.02.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:31:52 -0800 (PST)
Date: Mon, 2 Nov 2026 12:31:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <tshclix3kzs4iwgfxjrj46o6vebelntyikhthqwfpoi6muyckr@lhaix6uban63>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
 <2rtrk7tsquxekqhk7tsiomjnfzc3xfqg574cbw2m5b4ui4ovt6@2oxme5w4wsqy>
 <31db3de6-34a2-4ccb-af61-043f56d8f86b@oss.qualcomm.com>
 <4f7tyzvt2ojfmkneoaviegk3xbt2gegp3yoei57rzijcxkrlyp@b32nycxqybyj>
 <20261102092828.3728247-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102092828.3728247-1-atanas.filipov@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8669a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bJwWMc3u49Mdhy3934kA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX9P1YKqRmazmJ
 fod0MIjhOdLOGarnEutpTJP7q+NNmEgxBEfk5jbGyUEQjzFOuRH8H/FJKqcmawIBlRyyL2nrBRH
 XrD9rFDgE1ffXFp/BQiyEYW7R41at7xzsRqaaepnpBRWyU+MJl6pZx/V+Xvy3ABU7cqYEjPA3ar
 jzTG46frmGz0DjmDMrDJVu21pkJ5pM8ReKHr2ekhPeBFIWDGWo67Dc7JgysUdvWtVdqMiyYgKkA
 8hqh8vfohsA0uPCae1Q8l2+8Z768DsBl2R530XA1Meeby4UnQdT/7rsrT3R4haA5ezKFBEa5rCG
 xsruz984hyTaMyae7lqqhcqgNDyvEB0C8QYNAzKQEz0USW3omZtjHU4KMObar/MDV+SexqXr41Q
 1NNab+oxCfaMzCFBN2vkRPeSZ+MqUIKih1q5jjj6Ozg0QPcV2lq2R7yMZODDrhnu7Z+OoPu3vaF
 rGJnnCGvIMdJN24jwcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX3vQk4QhOcqTk
 +LYgWutLjZ/txJYEs74Egwl+0Wygkb1GxzLW5V22XS9HVljtu++489x5S87s+TPqUVwzSO0egs1
 qEf6++zjsz/Eb3FxXoBW5xJU8qofJFQ=
X-Proofpoint-ORIG-GUID: 3W_YVSlVsN0yanpHfQFpPogNq3RUDvr7
X-Proofpoint-GUID: 3W_YVSlVsN0yanpHfQFpPogNq3RUDvr7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

On Mon, Nov 02, 2026 at 11:28:28AM +0200, Atanas Filipov wrote:
> On Fri, Aug 21, 2026 at 12:36:26AM +0300, Dmitry Baryshkov wrote:
> > This will be true if:
> > - MMCX is a parent of the TITAN_TOP_GDSC (in Linux kernel)
> > - the driver casts the vote on the TITAN_TOP_GDSC using the opp tables.
> 
> Both hold for v7:
> 
>  - camcc-sm8250 attaches MMCX and registers TITAN_TOP_GDSC as its
>    subdomain, so a performance state set on TITAN_TOP_GDSC reaches
>    MMCX unchanged.
>  - v7 adds required-opps to every JPEG OPP entry (min_svs to turbo),
>    so dev_pm_opp_set_rate() votes the MMCX level through the single
>    TITAN_TOP_GDSC power domain.
> 
> > Checking the 4.19 kernel. cam_cc_jpeg_clk_src casts votes on the vdd_mm
> > (MMCX) power domain, while its parents (pll0, pll2) cast votes on
> > vdd_mx (MX) power domain. Note, that frequencies used by those clocks do
> > not match, so we need separate entries at each of the corners.
> 
> Agreed that the PLLs need MX. Upstream nothing votes MX for them
> today: the camcc-sm8250 binding and DT describe MMCX only, and the
> rpmhpd MMCX domain on SM8250 has no MX parent. On SM8450 and later
> the camcc node carries MXC next to MMCX.
> 
> Since MX feeds the camcc PLLs, which every camera consumer shares, I
> think that vote belongs to the camcc-sm8250 clock controller rather
> than to the jpeg-encoder node, so v7 keeps TITAN_TOP_GDSC as the only
> power domain of the JPEG node. Does that work for you?

Konrad started to work on that part, but currently all the votes belong
to the consumers, which means that end-devices should also vote on the
MX (e.g. see Iris devices).

-- 
With best wishes
Dmitry
