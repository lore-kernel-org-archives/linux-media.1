Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C2647D473
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465909; cv=none; b=YpQn3foVW9Xx+VkmwSY+sH77Mg1xsGEsG4bvDSoB2nPlkw7fgF5wV+maGQWlzRAkQK+Pzm3QXKjawh0z6AIbfkt0JUfcM4MsWXlEICdRs20ejo5AG8UV+7+La9REFrq6wKxsHKOnVf7xKlRnUlWiqsllE2aZCYwCrNYDgbW8D1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465909; c=relaxed/simple;
	bh=fsv5FuQjdenUC/MA7KEcDcRD5qJ+JKikKx3HzE58Udg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0eq1F8/xg8yqPX3aj5E3Enj1cF/LtBJ7us2wIQkgtDkg67AC0Hf5vYlp8gsMpAIXgs2eKPiJP80+D0XgBSvDY5dEnPlGnJvnX/3mvtLV59zSceWF8n7KXa1aWBLY35dS5bW4cvuEuThuSylnfV2Zq/Zj4inMiN2ArmsIbEgfb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CI8gvr/1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T50S8B/m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CI8gvr/1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T50S8B/m"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h30a2086730
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 09:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m1XFciMC/FLa8VakPPfRy3mt
	kacc3Afj+FPNQf0K3uE=; b=CI8gvr/1w5ZXZRm38i+8BGRL88LIfWTnN0MqNM8e
	L+61VU2lXgzj8J7GVB6+g5+zLW1gJxbmQWVmvYRDteXttBIHoLWOHVmlUEPu29/A
	Y+taWVgNqPwHl8KW6fcDSrUUgOl9FAWMfk0c92p00UWd5a+2cNHLE4wuvYP2H4H4
	hP9rm3BslPj98pVC4i8qek5qWxRbNGgYN+jU2NOGruhzl5l5jy6ZVPLnhn4mB4ep
	FH+QsCovJGjapiJnqpChffwKXZkdK7Ra6JN8IXFlzghDAbHIzKgRgFQ8pFGdpUj8
	J+7L+v4HBvMXUHLGlfCLD6vybnqAcIypHxGNtS69f0A1Qg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp8p2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 09:51:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so814745285a.0
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 02:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465906; x=1790070706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1XFciMC/FLa8VakPPfRy3mtkacc3Afj+FPNQf0K3uE=;
        b=T50S8B/mf9KarFy/9tnh/e0gADLD9yaZuqGjPWYnx9KybHN+c6cdRlUO/IT7fBILTo
         aTGFbNXqt1tDXBUO4NSvEzNKs0YP1hzA7nPM7YrP2E9fDS4wSf/IOA7GbjGYZw06HJ11
         tRAAv4fNYDqUSBU64iOXYUkPslPJt4gew6bsCr5iMjFEoPxPmx9XhPMkqBGI2hzsOS7w
         +LueLqfLNCsnWRND/EGqNXjcuMoBaGS+Tpu08VXa0HqkVGZ61xAG9Tzyk1n+wG9xwm4F
         GmQF3TaPtL/kYT/vPDhir07kyfiqQzwK4FGGyQENn256mouggQ1Ovu2397QIuxn3QXsO
         Wiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465906; x=1790070706;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1XFciMC/FLa8VakPPfRy3mtkacc3Afj+FPNQf0K3uE=;
        b=BFaagKRRHzwXnGye87QOkj6pExPuVvfBD6EeuaVr4b7JhH6Mn3XoF/YN8AaPFV8iuR
         0THKyhecRd76EV0jjnPoUWD/6LeCHLJ5lUyfTPmcKPQLRNYWI1nJ6wwyFDdVB/wUJo5l
         m54yMbGouLezy96/m1uaTpjksd5i8fj3W495tj0ugsm5stEYkMFucMERq0aY2qIj0gV/
         gSWSyZ7uMmaWYlk4CYJYevE3MQ/eSaw46gl11YA0fLK6YXWCQ00Y/UAv1g1rlT4shcl3
         2i1VSvosh/2nQ1yhgSoP9sKV8rDtGpuuBHoyxkgnJXZYHX9r3M4TUyP4pK3pYXflmf8L
         Ev6A==
X-Forwarded-Encrypted: i=1; AKwUvBy5vItH7GSfwpjv8IdSLlbo84IKp6OY+r8hY/3jJ7FFGfdclkhmS4LalhXqLM14DAx9n9rEsGNKdoXd2g==@vger.kernel.org
X-Gm-Message-State: AFuF++m1suePNH30t1bBXvoAL0sqpFs3NGKGKMmOYGzB8Pv6oU+/eoHP
	EFwmYvxbdC9fvIjdoCx3IQFR9axdmLHQwrNWbcvJ09W1HMBUMp9pfPA2jm7O4YMC18Ndlb2TkPk
	zHisXyjONHVpG9REqtkqX4kQIrUMC8PXF0+fgLJivD8l09cknxo7CTm8To82u4e5azg==
X-Gm-Gg: AYBFou2kup66m4+yEv4VSTyvfU1amL4Spa4JO8aCO4gCB/NRjBV2GeS/mXFdxOOU2iJ
	Hs9Lbj3dZFQg7DKkjCUfXQFpot+EW/mqb6Ocdu5O665JpBqIdVIaV3pAAAY7JhjziQWVqGTf0Lm
	dN5RomA2bSAKg0reySvj3iO22C4I7yoRGFGlPSh6F7OQ5UB2J4UBZ7gvGviY9zmeuQhh/Q6Ulua
	6OWtcP3WzMumUzGaKgNibUMRRV5+hIbjwXAzP9usF5zwoxmwGlQoJe6nkvrjsLiKHxKlfDwju4c
	PQKBMwjZ4QJwmuEVkF0B1ltVdS1vH/hMplLwVfVdWrBBagm5+Fd4wMNUPGNxxu2QXLSfexCNgiM
	Muz8MlYKHwq/raw4=
X-Received: by 2002:a05:620a:601c:b0:939:c555:efb6 with SMTP id af79cd13be357-93a29838e3dmr882761485a.12.1789465906064;
        Tue, 15 Sep 2026 02:51:46 -0700 (PDT)
X-Received: by 2002:a05:620a:601c:b0:939:c555:efb6 with SMTP id af79cd13be357-93a29838e3dmr882757585a.12.1789465905439;
        Tue, 15 Sep 2026 02:51:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm32642467f8f.35.2026.09.15.02.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:51:44 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:51:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v7 8/9] arm64: dts: qcom: shikra: Add OPE node
Message-ID: <nu5u3hr7erxzd5l5g4xnktdnnl2w43tjt75la4tkq4ddv5mfbx@npts3dwmx6wp>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
 <20260915-camss-isp-ope-v7-8-77b13d131d3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-camss-isp-ope-v7-8-77b13d131d3d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX+LZSAyrAg+hn
 iBbH5ZNbiUMyPeuGHhnUoOKbUMxGsfScXiHqSK5XMEBSHI1D+x+rPmEid6Lrqst4IcEzxRsbFph
 OLaU8ryhvgKAx1yF6BeW3qNZkA39soE=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa91533 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=I_ukrOqQsWpVYGr8uL4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Ojwv0aOixaq2-DNSnxq5kEPdRnoqafi-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX51hj8MnBfxxs
 MB/8qCX651EFwSSDaj4BJkLA78KhHMsvrdo8oszK2h+bTFPftcXETVkP2On44/cJhEYpTwb/7m7
 gsdKoGqkyUyJftXZd42lAPaO/cQmFUNS9TdTSXTg1m4zJc2mgyzHRvAM4LarEMU5R08J6jlE7QO
 OhElLbI50TAHdx5TpwU0JRCgz5gGXAZnPVaha176gJFOliSbXbAXp4yGDyja1Pd44NWLviKlYNp
 4VL+FGShTV8XPeJLGPT5JFR+7om13MSxcrhx60uQUZxUGvZOGDoMpAJa2YRB888nZ9SMwlpgxMb
 Rclqn3EuKKX1sgI1vImixCj5gDcTCHbz2TqEIB0W5byneCNUqO4u0rq09Hb7nb+g67mbRjF0c68
 qydGn40fAvQ9UlZUs92jex/HSsyP/LiVuRwhQSFsJOI/9hbqUZnYB5M03N6i3RYMRKudvb7YMTl
 HLllE97POD7UP/kNSnQ==
X-Proofpoint-GUID: Ojwv0aOixaq2-DNSnxq5kEPdRnoqafi-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150141

On 26-09-15 10:11:11, Loic Poulain wrote:
> From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> 
> Add the Offline Processing Engine (OPE) device tree node for Shikra.
> The node describes the six register regions (cdm, top, qos, pipeline,
> bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
> and OPP table.
> 
> OPE is a memory-to-memory block with no board-level dependencies, so
> the node is left enabled for all Shikra boards.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
