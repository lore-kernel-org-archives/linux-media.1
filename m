Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530913;
	b=EtLVBtOzNBOPOX3qHT0djqkz58apPEK/6F6ZysqwM5yXeBTVlpMB7jlqgaf0AmIy4UBN
	 t/srrRh6TL/z/W2R1AYjdJT+m3uZerTME7X3CoXbPg2iMpKN9KrEFtU425Mkwi7OKlhoa
	 33QfelgQW58ubdmDBaIAo0eMHVXhGHcliRnpyXigev7VQcl8x90XKihgclncoU6hYDnSS
	 m6TZWsr1Y3Fm60Moy2UoTWj0j1geE8CNmbzlZ9kVozTfML3FJM9kkhW0Bd/RqSP4ox/Z8
	 s6JmDzkDpJQKNFlkxCO/3eHsFvdW/wX3Nw/Igk2A6+AEO7YTiDYzGYP1qd3dgvhASjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530913;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=;
	b=g3O5ZyUEOJog0R0JhZuTzjppaS4NQzniGer+NhIctF0wyjkFliYInoBuQog/7CqWuztW
	 VSYTEOgKnMlyAl2+sfbF1vIYjvvarBcgB15TgwN4kItwgjtzVCaCpcIIv5+Wbh1tVIB+p
	 tnxosPuVKu1SmPM6LWoNqoHmfJ1WlitmrDMDcLfjMBptKx9nMldL7Kk/4lLmhkr/Knjhf
	 Ib5qYuYko5TnfXF6APX3MCS6AXL4X1gSHffM1tjbAxF4tcb+T8v8ko2O0LILkKsxMPgJi
	 cAfstSIqaXgS6LTrpxdqvkVJQuV/Fvkt0dzHWqK9vAejMljz5tznajlFFMlMnZdcUNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C9NNQjG1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXsHDjSB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BAD606A322
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 21:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2BAD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C9NNQjG1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXsHDjSB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtria2442066
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 21:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=; b=C9NNQjG1dc1jZvhz
	INZ5MeHYvQob7NbXk8rKACFzfVBqvffe3AeZqpaROPWbb1yfW8X42Eoclirq1ggX
	Iv6lahrbPf75YvtY/E+SHxCiGDixLnCRCphhgFyb/867QySF5Jq0o0odIg5FsFbr
	+gIx3aspInNHqeVDdXOKw+8zLjlusYIBeW2z9QCQetCW16+t30L23QL1ApdmfpCa
	Qb5ByE4iyExp5bA062UeZSfrBPY23z7mqxpmUwSdsR5gXaifJ5cZ4a+9cY6BveLI
	GhfhEoTHiMjjau0iJCk1e+dK5mwO82b9J8h/PnN7iDLzdeTljpqUM6cX2C4Hcvhq
	2x9wiQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hrnuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 21:15:11 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so110736c88.1
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792530910; x=1793135710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=;
        b=HXsHDjSBN+yDgmGuJrFT/6SYFGrwGDh7Ec+qdvvDvQyS3hID9zJ3maPPULaEgYM9Nx
         eVku8PPfbpIAb415+rUFj7aW9eC8aErrkgcTxLgUpgAylPQ/h65Ct3psJgsJbfVKJBpa
         URBp5k/zAyLaXg508punWFlitzaO9bX+DOxTe2xAvO0wTw9N3fX6ZHZfVQETNxjAU3zY
         zEYvzXudsFNPbXKOVRDZArhwBBS8Cl+PX2oqHkV6Lb8j5+c3t0V7681GG4rqzrJY1G05
         qS+DH2k0Y/kfVtYF2CtVS0wO92eXGitgnIP75MGnT0gV6h7aImEv4v8LOIXiZhElgyUG
         4WBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792530910; x=1793135710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=;
        b=RB6ts13CS/JhjHoKRvxG54pnzZqD3abnfjRLHAg7+JPfiphw22x1Cyqha3ri8R3f5e
         aEcb+Ndi7/8tKp41A0GpfwrpeFNps4ecxSQa/rrV3pIbbqYsJUpHXwb03fsLvT/fRC8h
         NDlk1+DIFYm3ydT598C1L2U53ZvLi3mdEb1lUQ2otrme4X3dXaGocWwn/geL2BsGWXo5
         nQVndhVsjZdct2/NMwamSYTW0FS1vm/vhxXBhXHV9u+a1gPTzAdFvtvVjK3Esobojs17
         G6geRCMSyJHIXHS6oqC6ZA5HyRZmAUM/30Wn9AQthQzqMhRbryGfJLEQHRxdvWs2zoRI
         yWVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjlv5UH2N2l3jkdeN93ozYxSXQcrzzXtSQh8lKODV03NCI8mk5wWXgfwGQjd6EwMBiveKTN1sgpd+Rpw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPyG1andHAUMbxQDgkunpCPj2hDP8/2LnaK9gUb7pkPZC+fb0M
	H7mjn6ynLChABhH3g56ZaTysptzUu4XQv6+KiCDomW6MriN5hCUCKcl7gvaceCdxFl14Zh5XKnt
	WYytb2XiAXNzG2zxGjWd4ONCXiAIqrSfw1VZ89BmWIJoGSEaw9d5Gm5c82NQ+1+6ZDQ==
X-Gm-Gg: AYBFou0KaDhoVK8Ktc9Dh+I+5DmbkJDXOgIlwiTD/mx1SeBXy22Z9qruI4FAoVcCb++
	rTzRP7b7wtz6m2iWmFwN6Zvzhi9RTk5Ji315ic1rSn23iE8kxU+JioJ/sSiib2mPVK0wqLwEBQf
	TZyi3WzVHKcMZjeRcyo2H0c1/Afk4zXhc5v3xTGdebjooV8shrizTXhA80Jqb8Z9lW4CDfKYN2j
	LQxbT2Q/xCDBL3rL/6ATWXRSywTFElzIeOcckPavLjMvgJGSg672XasUad/7g0U0LQbvFzqWm5n
	LTyKhmYuPZuqGfFGYJiZS8jP+vfVE8xfXRAom0yaZybBYFpkGO4g/MHslTqo4KQifbAC28lRSnW
	JsKjtM8QkCBAwKFo1tLxrYFgncRvvIi0m5xKO29LcPX8rp8SLDI3TVJ32Yw==
X-Received: by 2002:a05:7022:3f09:b0:18b:bce0:a227 with SMTP id a92af1059eb24-190a6adcd36mr67548c88.15.1792530910051;
        Tue, 20 Oct 2026 14:15:10 -0700 (PDT)
X-Received: by 2002:a05:7022:3f09:b0:18b:bce0:a227 with SMTP id a92af1059eb24-190a6adcd36mr67516c88.15.1792530909271;
        Tue, 20 Oct 2026 14:15:09 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d68f2b1sm980129c88.20.2026.10.20.14.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 14:15:08 -0700 (PDT)
Message-ID: <7b5392f8-de43-4d31-8f33-5a6d8e0af6a3@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:15:07 -0700
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
Subject: Re: [PATCH 5/7] phy: qcom-mipi-csi2: Add qcs8300 CSI2 PHY support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-6-anusha.nandi@oss.qualcomm.com>
 <20261019-elastic-psychedelic-chamois-e8bbae@quoll>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261019-elastic-psychedelic-chamois-e8bbae@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad7d9df cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=18DxlMPwXbuUbd9su7wA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4NCBTYWx0ZWRfXxcImlL4Ot60H
 CV2ekQVDJOKheAszsr2pMkN8l02+r4eQ2/7uk1GjchO9+lCar07D8p4fjhLWq/7g9GIjzvmEcMn
 SXfuV0xTI+V5n5k0TEdONoJLimb+mCY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4NCBTYWx0ZWRfX8T0K9Ll5vvrP
 SsNR7mcyyX1QkevRBIimZcT1ZIhWeoGoiIUEEWo/4KQHeY1pI5/sVyuTp0wxCZyPHUvAwBZM26a
 BRerIxsVPlmtcLk8jgOGEde4i8A27Waf4Hcb2oZwOY+wSFi9pQkFmERiainMAbBtVnIgmP2NJ92
 CmnVVmegAoqFOqnlrOQ+q2BmJKDVxdRI8lBBkCjgcX/8dUGMS77Xrb5KMf0If8z7gkTTQpmGQGw
 Ayg5ZZpMDh1xONxYw2tSJUqmmbBDdhsYs0tsWDO9qXTYEn5jXmc4Fz+8oYm2ae+UKkCPxH2qjFn
 Ri+ch2j4ODGd1rFZVEZKTiF7eRksvuSXkBdvEyy925fsLJln/NJ0dR9sEUJwftIoO0P18ZLrSnt
 nuwi9ims5oNQH8wXqJNXo/c4rI4eYGAuAgPIqDrQ37/wlirmAgvV7ENr08BCV9H/XNgON9U2yM3
 jCIKGMrXX/c3NudPJuA==
X-Proofpoint-GUID: d4LM-qYBTbcU55pOOgkLPZGL6BFRo5sQ
X-Proofpoint-ORIG-GUID: d4LM-qYBTbcU55pOOgkLPZGL6BFRo5sQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200084

Hi Krzysztof,

Since qcs8300 uses the same register settings as sa8775p, I will squash
4/7 and 5/7 patches in the next version drop.

Thank you,
Anusha

On 10/19/2026 12:18 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 04:55:00PM -0700, Anusha Arun Nandi wrote:
>> Bind the new "qcom,qcs8300-csi2-phy" compatible to the existing
>> sa8775p SoC configuration (mipi_csi2_dphy_sa8775p). QCS8300
>> and SA8775P share the same CSIPHY: in the legacy in-tree
>> CAMSS driver (camss-csiphy-3ph-1-0.c) the CAMSS_8300 and CAMSS_8775P
>> cases fall through to the same D-PHY lane_regs_sa8775p[] init sequence
>> and common_regs_offset (0x800), and camss.c gives both SoCs the same
>> pd_name = "top" Titan Top GDSC. No new register data or power-domain
>> wiring is therefore needed; only the compatible string is added.
>>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> index 821c6a0a916c..cef4a90ca539 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> @@ -453,6 +453,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>>  }
>>  
>>  static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
>> +	{ .compatible	= "qcom,qcs8300-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
> 
> So devices are fully compatible? Then express it and drop this.
> 
> Best regards,
> Krzysztof

