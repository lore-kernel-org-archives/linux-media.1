Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144772;
	b=CIgw4kSWPlrwlwWlfgt41cqK/5d6X19EgCWlsYd8jC7LlQal47xKLHW5Ev1oNO39U6JC
	 wnqkNaPgbj9QPuymhU+Bu5LNHIfjL/AKhJ3hjAUpYIxC1uwbs/BqNLpaI+ApAv7xPQIhu
	 pBykZOS91uECngF3xyGeYoEBdjejmDiSv74nwBzzb1K02f6hjJj2KiJDUqUE3Qi2AYHGG
	 zVp7uC33JvAfyKAdwhQjDtEa3GI2c9gNPS0GmJftLwhQjTZnK4S5BawOI/LJR522zQQ0a
	 /mxuw8SK/K5kQF5xofn8VKPRE5rG4i/aiIJ93agwQsa9Zv1bhygVjREfbAS953LBN7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z2UfHBvHRgGayx7r8hZ+HGVeH8gt1wGqjG5tuFe3plk=;
	b=RtPBJKcQ++gEi/DK8HRjdJfU0SkwhRjLlBhJlibEWwOOu5iR2+wVlVRoTRanXto8e/Y1
	 4hJXRtcgHp8OywBWfdQ5AKtYdZ4KrlRB48FjpIc/bm7eVyuxz7meg6b3rFWjT8K3ucCPN
	 MoewLRFR5dYcsrZeK1+eIwCWmaHH0fR/62vjbgpMVa3W2lDa9YDGiMV6Ua/xuadHBxCVg
	 LNPEeAm6B/VinHW9CGf8SMAvD2FIWpLA4R5OdeqckxPSdXXhOWEtsP/4dO4W5bwgCp7bN
	 uOyXGV984zDwLQH2j2nlRjmWGPZsiOtJjRoFO0wDB5o9hVcuZ3TXy4vkGLt0d+YQljQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OhsuEJ1E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OXInXtkG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF32606A31D
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 23:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDF32606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OhsuEJ1E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OXInXtkG
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RKt7hK2424619
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 23:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2UfHBvHRgGayx7r8hZ+HGVeH8gt1wGqjG5tuFe3plk=; b=OhsuEJ1EELNpbET1
	ZDtDr9vJ+Nl7HYv9/qC1dtjz9y1LRtW1aPENhQMw2FwKRFKJhCUM2QRnDS0RPms+
	8L8XB4CobFUaLXFINzyGWCh0j0vwQ+UuJ+WiuQZc9CodO8sRizoqqMsu6UZAGaj4
	A6C8VJi4lfMkEr5vdsj/wZCkft/VUa9u5Qqqnwc8g0kyhJSwEKBLDBHjHQrJqGG9
	D8oM+YdR6BvTNFGAtV746g3UXptIbLH3NTrrf2Tm11dtnN6abTMKQOEhMksLLjuH
	HpU5M78I/ie3Um3TizGz+7kAUpkKL5C1CoMDdlU4kHppTrtJmBhdjjhJ3rlw/CTh
	fKs56A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2tc353-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 23:46:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so454011eec.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 16:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793144770; x=1793749570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2UfHBvHRgGayx7r8hZ+HGVeH8gt1wGqjG5tuFe3plk=;
        b=OXInXtkGzYX06AU3OxoEzP/IkcnV7oIfASflVSE4YRtKCSMbyAX9tbGH6iRk/WO49L
         nIb92uDnDpONO5T1H0uKokBg0vB03IHJwlXNhgL8a3Ga/hHbeS/RcIefG92r89HqfoY9
         RQlShd26/WYm3LzuplHqMvJKfng6JygG2vRLmoUk/VuODUpVTDHdatY4nzAg5plOySb8
         UfassIFwLTr1IWrAiDwQ1qvRmn069IxDMHju7Qefg6aFTlGoM4yMRvaM5ChEXzLp6zFt
         0Cjf1vsxlZrt5+CSfwemlmeFQoPbQjkN6ht6eSTCe/cgP3WoJtMa7GADiU6igKpI6jWh
         Nodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144770; x=1793749570;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2UfHBvHRgGayx7r8hZ+HGVeH8gt1wGqjG5tuFe3plk=;
        b=mp4QWjifrelv1PkSxLbj7Xrb1frPkiy77K90mMoT89jbGmxRT5auewkuR3N6deRTZ3
         Eys+Jw73x83KIHIAcCCRXDpfoX4gE0L3Zd4jH7dlv+syVkIRjx9ze13t6C9nVTMndh5X
         FT5+tOrOKYlA+sf+b5QJBOzMjnIhmZkbJQysVLRFVvPkX26ldJrFs96Nu7Xij85NZDPM
         82aLzwMtHAXo5ZiV6+XfNagFh5Zuhy4o2ZS/dmFmV5Tom/yCxy4SP2I4hhX4UHVAFaU1
         zaPybtRaMEgtiDbyB+lZ8kUxzpDOvlny2HYW5vPX97QgTWuXJJhnrtSHaTEuqVo3rqNS
         LUVw==
X-Forwarded-Encrypted: i=1; AKwUvBzpFP8KjNM2Nitekjnqm/U2925L5vjAo3bGUKkaUDMJIwvdHksaFoyRiscwYm7bOuFzeteunOg2MGPpKw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJor6dZIqQjx4KHKPLoRL4+ISqrCPOctX1egNST+j2fLMTWD2TU
	EOpKPcvCHjBfNBbLLeW+k/QmObod65LI5Hwy1F8acwgcGBaIxjFBU5vxwzKpLXB2NZ3huJR2bf4
	1kXUnPVu6+ZJ5REY4Q0ZPYomFZBza8oJIHmbnw6fB+klpLOYf2+3esioTvZSQkq68/Q==
X-Gm-Gg: AYBFou261eXbcyeRzCyy/RqEDSSDMLcacO4bn6O6h/y2MCzSbcFLMDwPkp4cxbBefra
	nH4qhOAuiJ7Mo5UgYnpBKDTNbeOuDiRkJjUuSudZmsom6i0I7Jz5AfGiY+OmnW80HLdTaZ6twMT
	Q//Kgb4PptTlA90+jx6RdqPACTgcFl3IWTinBBsOANtkzlynh2k4Tt99uTN2r9IX9Y+psXXqUa4
	58u98jUGv3jmrnZ5JmuRmV0JrwymRIRBluy/aPris6j3dd3KJfvskH2DhQk+Dadt6m+JktdlSCi
	KdFuyp3QwE8AMzmSgI2/eWhGTHf/aklgTSBgyRs7q4Fc5t/InS1egGcI8fubNk+NScKGCtS7jmM
	WESra2M/aAEJkX9YqA6zX9WMLdWd0JZJRScwZAT3hDvyffA9gMC8P51711QKOew==
X-Received: by 2002:a05:7022:1217:b0:14f:5cd:f286 with SMTP id a92af1059eb24-1a6cf729c4fmr1036868c88.34.1793144770013;
        Tue, 27 Oct 2026 16:46:10 -0700 (PDT)
X-Received: by 2002:a05:7022:1217:b0:14f:5cd:f286 with SMTP id a92af1059eb24-1a6cf729c4fmr1036828c88.34.1793144769398;
        Tue, 27 Oct 2026 16:46:09 -0700 (PDT)
Received: from [10.134.68.191] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d85f23dsm153319c88.11.2026.10.27.16.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 16:46:08 -0700 (PDT)
Message-ID: <b1312ee5-52d0-4294-a05a-f84bc334af74@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:46:07 -0700
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
Subject: Re: [PATCH RFC 0/6] phy/media: Add generic MIPI C-PHY support to
 CSI-2 stack
To: Bryan O'Donoghue <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <pFAaFSKH8thStYg6_Ew1gWdIvj5lbNBF36QKdamV1cU1Nc73wEZfM_KdQWL2NmB5fvaUpMPen7qMOzjHZ9ROIQ==@protonmail.internalid>
 <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
 <141c5032-1915-4dac-bbcf-e697b762ae40@kernel.org>
Content-Language: en-US
From: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
In-Reply-To: <141c5032-1915-4dac-bbcf-e697b762ae40@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae137c2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RNcpwd5BfBhkYgEZawkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: w435-HUGx6sPT5pNH7SdVgiB6dtLuoS7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA5NSBTYWx0ZWRfXzSK86jbrvsXb
 D2jY6rvoIeYZK1TckbELf2DB/hLXEBRapvgdBrOt7Nr6mYFcAW3VqzOSmxZ3MURY3ws1t277whm
 QxidK4egoOAKJBf8eh6tJV1/Y43uLg4=
X-Proofpoint-ORIG-GUID: w435-HUGx6sPT5pNH7SdVgiB6dtLuoS7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA5NSBTYWx0ZWRfX3e5Zdz0+Uhsb
 nNmILCHfaFeJyS1w+UNMtEGp5tTtl5aCjHITj6ILS+I9y4lozRXiUkffcq9Wkr8pnUeI4w835eF
 PjF9XAoXssAl1mYWPGBOu33YX3QN5+f2eeVaJ0AWbPeJkW8YGyNrwL++8xjFO456K7nWOWe9Bhz
 nN/ypRSP1AaYii5p3fgJJr0qJe5HFyRemmHoKhoAADETM0yAlPgZwwP6xI17+bTsda2WiBc+SWt
 SpTwxmrSqq161bnrfRyjeN6MShXlIg6Lgi3e55/J5K6nRixvwutCXF2H3hGEf6rR80E6upc4HsM
 FeSAVSPIkloX+fg3nePy9rmPsBXTxugk6Z1eHKweYlLUtG7UT+kUBj3pnzBAtUlb6ZiUN8iXlf2
 VQbCnZBux/uKipCS4RlskyWQDiZHETdMvqu38/EGnx9KH5lXRIEnVjFmJ3ASvps+E+XwDHbw8NX
 BqNN1PdP67yklq4bwHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270095

Hi Bryan,

Thanks a lot for your suggestion regarding file structuring and naming 
convention.
However, we think that having the separate file will make it more 
functionality oriented distinction. It is easier for addition and 
maintenance.
Also, we would like to propose to remove 3ph from the file name 
convention as this is misleading the operation. DPHY is 2ph, whereas 
CPHY is 3ph.
We are proposing to have a naming like phy-qcom-mipi-csi2-dphy.c and 
phy-qcom-mipi-csi2-cphy.c as the names, DPHY and CPHY are sufficient to 
understand the 2ph or 3ph operational mode.

Kindly provide your suggestion.

Thanks,
JZ

On 10/17/2026 4:39 PM, Bryan O'Donoghue wrote:
> On 17/10/2026 18:13, Nihal Kumar Gupta wrote:
>> George posted a C-PHY series [1] which we are currently reviewing.
>> As discussed with Bryan, this series shares our independent
>> implementation so the approaches can be compared.
>>
>> Two aspects covered here are not in [1]:
>>
>> - Settle count calculation derived from sensor-reported T_PREPARE and
>>    T_PREAMBLE timing via get_mbus_config(). [1] left this as an open
>>    question.
>>
>> - Data rate based register sequence selection using effective bit
>>    rate (link_freq * 32 / 7). [1] noted downstream does this but
>>    deferred it; this series implements it.
>>
>> MIPI CSI-2 operates over two physical layer variants. D-PHY uses a
>> dedicated differential clock lane with up to four data lanes. C-PHY
>> encodes the clock within the data stream across up to three wire
>> trios, eliminating the dedicated clock lane.
>>
>> Patch 1 extends the generic PHY framework with PHY_MODE_MIPI_CPHY
>> and struct phy_configure_opts_mipi_cphy.
>>
>> Patch 2 adds t_prepare_ns and t_preamble_ns fields to the CSI-2
>> media bus configuration and extends CAMSS to forward them to the PHY
>> provider for settle count calculation. Sensor drivers must implement
>> get_mbus_config() and return non-zero values in nanoseconds; stream-on
>> returns -EINVAL otherwise. The strictness is deliberate: C-PHY settle
>> timing is symbol-rate-range specific and no safe value can be derived
>> from link frequency alone. A conservative fallback could be added if
>> reviewers prefer.
>>
>> Patches 3-6 extend the Qualcomm CSIPHY driver: refactor D-PHY
>> register storage to accommodate C-PHY, accept C-PHY mode with
>> multiple data rate table selection, compute settle count, and add
>> lane power mask support for C-PHY trios.
>>
>> C-PHY encodes 16 bits per 7 symbols, so the effective bit rate is:
>>
>>    bit_rate = link_freq * 2 * 16 / 7 = link_freq * 32 / 7
>>
>> where link_freq is symbol_rate / 2 as reported by the sensor via
>> get_mbus_config(). The rate-table entry whose bandwidth first meets
>> or exceeds bit_rate is selected.
>>
>> The settle count defines how many timer clock cycles the CSIPHY
>> receiver waits before scanning for C-PHY sync. It is computed from
>> the sensor's T_PREPARE and T_PREAMBLE timing. The /3 factor reflects
>> that C-PHY distributes the preamble sequence across three trios:
>>
>>    settle_cnt = (t_prepare_ns + t_preamble_ns / 3) * timer_clk_rate / 
>> 1e9
>>
>> D-PHY settle count is unchanged from before this series.
>>
>> [1] 
>> https://lore.kernel.org/all/20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com/
>>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
>> Nihal Kumar Gupta (6):
>>        phy: core: Add MIPI C-PHY configurations
>>        media: qcom: camss: Add C-PHY timing fields and get config 
>> from sensor
>>        phy: qcom: mipi-csi2: Split D-PHY register settings
>>        phy: qcom: mipi-csi2: Accept C-PHY mode and add register sequence
>>        phy: qcom: mipi-csi2: Add C-PHY settle calculation
>>        phy: qcom: mipi-csi2: Add lane mask calculation for C-PHY
>>
>>   drivers/media/platform/qcom/camss/camss-csiphy.c   |  90 +++++++++---
>>   drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
>>   drivers/media/platform/qcom/camss/camss.c          |   8 +-
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 159 
>> +++++++++++++++++----
>
> So on thing I notice about this series and like is that there's a 
> small change to the existing 3ph-dphy.c
>
> - Since it supports 3ph-cphy the file should be renamed
>   3ph-cphy-dphy.c (or something)
> - I like the progressive nature of he changes in this series
>   as structurally the right way to add stuff in. Small digestable
>   commits
> - I think the missing piece here is data_lanes[] and lane_polarities[]
>   per the other series from Qcom
> - Another thing is the other series from Anusha has
>   a more advanced mipi_ops data-structure for CPHY.
>
> Basically I like the approach taken in this series for a smaller 
> change to the phy-qcom-mipi-csi2-3ph-dphy.c file.
>
> I'd like the best of both series - I think there is alot to resolve on 
> lanes, data-lanes and lane-polarities in the other series and looking 
> at this series, it seems to me we don't need a separate 
> phy-qcom-mipi-csi2-3ph-cphy.c, I think Konrad observed in George's 
> series that really the file deals with 3-phase PHYs and that seems 
> true enough.
>
> Please work out between yourself and Anusha what's next.
>
> If possible I would prefer to contain 3ph CPHY and DPHY to one file as 
> is done here - at the same time the definition of CPHY ops and lane 
> mappings is closer to the spec in the other series.
>
> I think either you should take Anusha's structs and lane definitions 
> or Anusha should take your approach to minimal change to the 
> phy-qcom-mipi-csi2-3ph-dphy.c renaming it.
>
> One of you needs to pick up the patches from the other one.
>
> George can land his stuff on top then.
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  51 +++++--
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  25 +++-
>>   include/linux/phy/phy.h                            |  47 ++++++
>>   include/media/v4l2-mediabus.h                      |   2 +
>>   8 files changed, 315 insertions(+), 69 deletions(-)
>> ---
>> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
>> change-id: 20261017-cphy_support-2ce4d656e631
>>
>> Best regards,
>> -- 
>> Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>
