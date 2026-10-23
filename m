Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792716777;
	b=n+Fx/vyralYU021GEQjJjbXM1oIfyqKWUkpCk/VP+tEx0n/n0r047hN4+86tEH1m4sho
	 lj4KBpG8/D2/3gEIZW09eJv68pqZnib8P8sCN+9mg8GryZhcXjCChZFIek0MvVw+HhtQK
	 vGEju4m0dR3ZJlNhhqsqYd+//1rsTZOOyt+EEbpaZyqzWfBcp8qd0IRlZ7OopXVISrp31
	 KyLKsE9pK/8xDmQ9Y8Mv4WMD3bLttsDCIqpmPlZVAke8jCqyDhPpxqm67rS+2TYtFbX/0
	 FMnQ13jfQ83DacZA9AAUWI6rtYvdykKKeizTdN2XjrLI21CuZqKGKKCAyweF8M4Yaag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792716777;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s883LoO0lM4UTK/8TXk04oaoWPK/eZ+nlT0uh+23ikY=;
	b=KoPRWw+2odWOkxg5UO9AHD1g29EyqOtx0CUOgz5GmACZqLAefb6jn24COq975PJzDG+M
	 YCx8qpuIzLbEpE9HdlC08J3EE1VIS4cq7gh0cfhkhvElh8f45f3Droq4MjlI1AsXbRsSj
	 u32vLtswBMdH5065tnlS1fvi9ZD1Lab29WId7465DjPmC5vHyyGCVSQh5+HDWKxVQJDJJ
	 Clxhd1txK4yArbowHLlxK/Z5M4bKqtABQU/X3PyG+qdZgE7VO0lrw0Nx5O4exkd9g0ho1
	 RkwzbG3Mf/adGBk6bsF7wK/zW8bIDk5ATIXSLR+k0NwxHPgjDrSd+Rj9mnNfhEu9VDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NX415fE3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VsS9FNQ6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333FA606A31A
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 00:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 333FA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NX415fE3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VsS9FNQ6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MMF3SB394150
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 00:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s883LoO0lM4UTK/8TXk04oaoWPK/eZ+nlT0uh+23ikY=; b=NX415fE3rWdzG1Sj
	Albm//L03kjdQGqn7HqFGco3s/S3+DeUF4rvHO9vy7Qg4lMeMR+5NejffyY81nBU
	lCLDwLMfgzRC8bhrIN62DwKsOwza8QFHnolHFmyJNGZiGu80As/YaftJTKWoV/AB
	cWqTwBtOo/9JOHdYqg5Eb1m8XwHvquOdgDZ4MMn/A4272z0CXd3NwBG1YiFiz1K8
	yFMo+/R1MWYegWgbtF3l5bLbOsw4ePMLySS63NaNzrGJX76LB3aJCqNJIKMMuMba
	Sz68QsKCA2yFBeIMKPREeOfMOQFlXbhHDNv627V1un/ZvJ5g/dzOn2nJVvSLvYTX
	8U64ew==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmts6rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 00:52:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so1189180eec.1
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 17:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792716776; x=1793321576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s883LoO0lM4UTK/8TXk04oaoWPK/eZ+nlT0uh+23ikY=;
        b=VsS9FNQ6IYusgSDTY/aBENcqBxTRdtpE33RYuVujnOzRPPthoEHB70Bnyl729fvBOF
         /JvYmwrFDTbOpu/ePYohOU23gS90avqMkOJyFWHYdFcmgIEDIR0Yeb5UJ+dEaAVOtMYq
         91N+oymuaHM6VrgtQmUoks4JHByIybEb3XL/F6XatE4Ma5hd8uGIN7cU0l2zOvVUdmQv
         uC6BjhaERamzDK9qWd7c3eajdWzs8BvvC+gxPV0y/5buuwHE6DmpwFctamQdxksn0UbL
         50028aQKxG8YfJSojm2ysnlD3563Uq/2wA4aS2oKjy+ZbLoElNwc33QoOUvPLDNxU67K
         itDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792716776; x=1793321576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s883LoO0lM4UTK/8TXk04oaoWPK/eZ+nlT0uh+23ikY=;
        b=D07sK/+8Hyaj89gBINPxHI7f6UMMGo6BUeHO8NZcPk8e+IMddVY3qXscWHKk/1+dE2
         U50tO8ID1NudIAyN8twmJfleeDkxQpPEhsxRTY75+wy2xJSyLDC4pyBfREzjMyMidF19
         kmeN+sakQ7c0wVnka+TPhHG7C19bf/baV8T7TYCg+HTBNjTssOi/Jw2vg5oB+Vl1glK5
         tEGe5fhV16k3lBWECQkx45TfFAWYNFIFIK1ddgAoQZFneglrWRUO20F6nfufhF2bW0t1
         /84vQ9FGsqoQ2m8BrAQzZR+SmjW7spabi53jZWmo42mgYlLM3AlKiRHbEQS5wfozP8l8
         EXaQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7IW/JDVzNYsrAogjFrsUxkCyKqh0O/S8+Zh0eINNCoahrWJlcE1PzpBeZKc8JsTyXuPFo/k4N0hge1w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIJVnPbCQ0jNyuub7YylxqEWD+CFEfKMF8cQpe6Je3HJlWpr1Wh
	04IK4Ec8JqUnfp4ivClQSLKRB+EU557HvzfCx74fjAfvv64Kx/NXdCdrJGEKPX8ZmdiezxcwnhG
	3c2A1KLX0dgF07G7JkrZfdkwPtlWLG6wLL+v/YBK5Oa1bzq/pt8UFhIdCbVm78rh97w==
X-Gm-Gg: AYBFou116JLEZ7PvJ1Y+h1jS0GelrH6QkIrt/aK7bImP0hvfpCrfOH6k1aEN4OzDFEJ
	xjNRL2+61u/+WP3X1FXgqZTSjpwngqptgOSOPhNW7HvSQQU68FtE7YK3qRkI4pRz4NEpsW5Xd0l
	0UtttX72rng9O5TpwjHgKazWFeWRdo1S6greTQyKd/m3OASZRUhBtHvZiM2IsqR11k76ceX5zLv
	Cp+eUWC6RwJOELPMa/4BtssOesX835sPkyc5VhXTECWE9l+ta0J1K3wbMu7Oix21gfkyOvscKwd
	dHGmKCmBW/icqLwmR8LBMYmOqkXfH8F0eCTvfUB4DfsNJ1SlFEwKQL/AHONveYDzXBulqagm7eP
	hzbR9I/5TdgUt4GzvMkFdK6eJAhm0LS1Fk5Zi6+hRSgxZt6j6UPtmn/jrlA==
X-Received: by 2002:a05:701b:4349:b0:193:9aa3:4748 with SMTP id a92af1059eb24-195bc01e742mr1050060c88.1.1792716775566;
        Thu, 22 Oct 2026 17:52:55 -0700 (PDT)
X-Received: by 2002:a05:701b:4349:b0:193:9aa3:4748 with SMTP id a92af1059eb24-195bc01e742mr1050029c88.1.1792716775026;
        Thu, 22 Oct 2026 17:52:55 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eb9afd61sm1802501c88.14.2026.10.22.17.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 17:52:54 -0700 (PDT)
Message-ID: <101a2b35-5bcf-48c3-b862-6cd703c67d76@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:52:53 -0700
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: configure C-PHY in the new
 csiphy_stream_on()
To: George Neacsu <geocausa@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        alex.vinarskis@gmail.com
References: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
 <20261017104853.148839-1-geocausa@gmail.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261017104853.148839-1-geocausa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adaafe8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=orMkujGkvO2Z0ebMhLoA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: Qd7DbtsTK324ntEZPppOysxKK28sTdeF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwMyBTYWx0ZWRfX0y1XMrlud5kU
 0MvtJM8PEmhrwPZ0XHgbWNuIHD7gnGWeU6FwVLNyh4XtxBMpX4mXr4I51uxTBnkd43RM1Afwqxh
 OAmmBcZGYtIDAH26QINFE37ciwFr6RcclPBFitGP6LMwc9j1JSxztNfcmbmUYaGzlLdJFNQr2dw
 raP06WKFbaK6UkY2PwwQPRJLqItho3fDxj64Ln0XO8ehuixdz/tYMbYvm4M898eZMw83zqCyhr2
 nr9HbD+/oV+pk+QmqdrWHutgwSy6ujmygwXZ0fyjyLSiqCHuBssPbSVMnfnt8j5agUga+961uqZ
 p4BQP3OoilBR0qQiE9IeiTKY5HE0OxiCRBIuZ9+U4z9tGC0a55IWeuAIDAUIhhYpl7SZRtv/pc2
 TYfLjv6+05lj9aAhapjrLCAwVEwv7KO/+mNvJUg6z9vmurux0gLohLK/DSBbpn5SwpR/0iTuUk9
 Im57M/m1rrImc+TZxOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwMyBTYWx0ZWRfX8t9WwG7gfMAc
 sbTU/5lnzMcX7FOCDE1kMu0eIwcmmhXE1rdblUI1/TLnFvcLKChEdwC4O0AIDTDhdyXSEH4GNUh
 B7iPIl8QC+4RgTnNZNQJOwi0zqYZwfQ=
X-Proofpoint-ORIG-GUID: Qd7DbtsTK324ntEZPppOysxKK28sTdeF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230003

Hi George,

Thank you for bringing this up. This will be rectified in the next series.
Overlooked this.

Regards,
Anusha

On 10/17/2026 3:48 AM, George Neacsu wrote:
> Hi Anusha,
> 
> One units issue showed up while testing this on X1E80100.
> 
> camss_get_link_freq(..., cphy=true) returns the V4L2 C-PHY link
> frequency. The media documentation defines link frequency as the bus
> frequency, explicitly not the symbol rate; its C-PHY pixel-rate formula
> also has the factor of two that makes the C-PHY symbol rate twice the
> V4L2 link frequency.
> 
> For the SP11 IMX681, the exact Windows/QTI sensor mode programs PLL2
> for a 2.400 Gsym/s C-PHY rate (19.2 MHz * 375 / 3). The same 68-write
> mode programming was also observed live under KD on this machine.
> camss_get_link_freq() returns the corresponding 1.200 GHz V4L2 link
> frequency.
> 
> phy_mipi_cphy_get_default_config_for_hsclk() takes the high-speed symbol
> rate, so passing link_freq directly here fills hs_clk_rate with
> 1.2 Gsym/s rather than 2.4 Gsym/s. I think this wants:
> 
>     phy_mipi_cphy_get_default_config_for_hsclk((u64)link_freq * 2,
>                                                 num_lanes, cphy_cfg);
> 
> I instrumented that path on X1E and get link=1200000000 Hz and
> symbol=2400000000 sym/s. Capture succeeds with those values.
> 
> The qcom provider then needs to keep those units distinct too; I have a
> separate comment on that patch.
> 
> Thanks,
> George

