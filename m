Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74145387599
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852090; cv=none; b=JW1nRw/RGCC5Q0mW7KparN1YmTya11Dn5Ed6I8gmvMsV6SXiXHBBt5okEP1ffdQE43bWccmZNfytK5unXbeNj5hmQYfBYN8iQ3N28LMjpLj5xvneaAxAV74GfBgxQxO8jiVxNmYNMMb6sduQzsIee7jz50fUYUhHBmY+yFqjyM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852090; c=relaxed/simple;
	bh=UbArGawaOLt004uiQzVxVKoD0CYmXsvOoyStHnCjaBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lH2W8irTqSexikgFGmgxgPpbpuLBhXfJ6uYJotxij+FmpaBxSGx/r3e9gM0gfwx+k1jr9jKNzgLJuY2NUiCDCNocYd0NhSF5qCwXHQq7fTfiXCZ2y3jI2EZnEI01jjBPQrroeKE06CkQieBuGbGVGawKn/MdYpVXCsw+tSNE6lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M46hdB4n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUTPpF4o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M46hdB4n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUTPpF4o"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LjD72172626
	for <linux-media@vger.kernel.org>; Tue, 8 Sep 2026 07:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CT4nJKvnmHwXrIL3UMrQ8SXJ
	kJUib8CpEc/1U78sn/4=; b=M46hdB4nERfHRDmec6ezX877heZmliZM8niN4dK8
	NxyNFZLj1flK58vXQMnYrRXusgYM59w13QMc9YZ8U02VsVHYbbYRIhcBk+rntBD2
	z/aGikmrhBM+NIOuggGJY5lkTfWKhc+kGFUL7s8S28EiR2PTHQFEmsh7JODngCoX
	iPBN6tCD8/7R9DXd2u4xwlN9JU+3cWkZouJnkBPi95pYhPYfiJSQUVBpQ5rk1LSj
	2HX2SAxtgKXguEiHgTVJr51Og5+A/MiMl35hBPcn+BD0wa8BaAHzo+Myf9yMCuLz
	hJ67l1Eg1h+YQfgqgFNFRGvUIzZcwTfsHVIcvvfNGkqVgQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrj7xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 07:21:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93975d63ffcso476887585a.3
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 00:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788852088; x=1789456888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CT4nJKvnmHwXrIL3UMrQ8SXJkJUib8CpEc/1U78sn/4=;
        b=cUTPpF4oI/6HKS9ArlIDEnjHdvi8HIXnDq39YX/i7cU19hHGrPR6DVBY6FTIOPFR0F
         jjHhLK0up+PvE1a4QeYvBsQU7/kv8nMBqVhfrY+AaQD2l2cqso4RFycqZ/9rSaSYOx6d
         31fD+JRUsnvfFXjXzA72o5xqoFbTYzGQS2ZRQBFEnaTZKysUMBZmNQSytvvZQ9E0qKQM
         BrU/Mor00Ioa7Q+oyYO0X6Mz5rGtdULF5hVi3Xeh41JmUbHzPdhXDVvfIGbm6ARmfFDU
         4s7iK7ENCohc7uyZitL/GshPqKHW94ILTfoK8G1rXrMrvwsGL+zWQfMnBB/v6dxqeTUT
         VEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852088; x=1789456888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CT4nJKvnmHwXrIL3UMrQ8SXJkJUib8CpEc/1U78sn/4=;
        b=dYIbyeG952dg3pqHLfNq4BcpARpGiBwmfJS+QrM1xBCXZxo/Vet0Sj7eDqV8AQZZBB
         5XBTVgSvk6V0mSJHSKY+9P+930O0mlm6oVRPZzLwsUs5upxtwD4ynNSBkdg+4VDwbcL5
         AGz4NWdnwSXqgaNKsqgT747F6YOmnFLCp5rbUGvgkxuxbEtMNODq4zrZuWHhsUty0HPE
         3SHrnzeKUH2Vu6BGhZlknw5GE7p5SmQdGbMOj7JvHTcABpWrTm200lmwLImnJrjaDx8h
         PA8UClX4pDdxvaO42ZgDh3AkRihj1QaBp4xyXdrYgva+3kavgj5LLwYDPvSwbgVtV6WX
         58zQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqJpAe6oa3tQ4eot1BQQBXoQo/VrI8cHr+iZLz5Y5Y2cULm8aXdAzUTyjg+Oowl4ceDysZBNnCENeVlw==@vger.kernel.org
X-Gm-Message-State: AFuF++m0PXli9L4upVKPaieKuBu2Jieb590ejkDZb8l3mGHJhfa6qAHD
	2v/Q9LIljUYpnZwTJlxpNvcJ+z29Zch02Mnh0VbKFN3RwX+iPsg6KkNTzx5opmCogVGaedod+P7
	dJi97cLfhiTjCzRi9kSJtPJ+NZe3FAKy8ziKeQTpiTSPlMWQZF84RgVPu48lv4y7iqw==
X-Gm-Gg: AYBFou3c24fQBoQB35IUE/Hhxs3F9UWcVdpYXoKhnyC21KC+nlQ65b5bjjrO48ByOI0
	Ll5c5cSvmdIbbqMVl1oI83rj6+aikQBHAl7nnFy0YWtj7f8LoYbm39oidmNlHSvf8qvQs7MntVw
	BM30zrVVNC3FjTo5X4ESFqxdc3ZhfzaUSMHRUJdtMhgpbj2Jgorkk7EAow3nZBpP3fIJeDGpeHU
	pnnj/WeC2ax5xU6RH5n7HW4rt+TewDNy1BgRTWt1jthkA+FY1lbpDjEyrhh3kdHvKs1AiFU324H
	UC5aqqmK8OdLdn3iAUWaUAo5Q+hGpqoXZabTlsGBvEah/9skryznNfaulFb7w+4cIwDNJLxfmR1
	Rab9KpOJAA9g=
X-Received: by 2002:a05:620a:4054:b0:932:ddff:123d with SMTP id af79cd13be357-9398042e263mr3035261785a.29.1788852087735;
        Tue, 08 Sep 2026 00:21:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4054:b0:932:ddff:123d with SMTP id af79cd13be357-9398042e263mr3035257985a.29.1788852087230;
        Tue, 08 Sep 2026 00:21:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm36575044f8f.24.2026.09.08.00.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:21:26 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:21:24 +0300
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
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: agatti: Add OPE node
Message-ID: <jncyxiupuqadcasf7te2eugg5jog7yg67h6oilw57q2hblnz5u@uw7jbabkauta>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
 <20260907-camss-isp-ope-v6-7-6b915b9c5131@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-camss-isp-ope-v6-7-6b915b9c5131@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX6GiCCKlK0rrA
 pqPuFsg03lW2Dt2yDc2MehYVFGPs2W7PLSLvRB3TU641IZOq3H10ZThzNrAvtIfRtlCk+dM6C6g
 i4jBtb+tfMwDY5ePCa6nZovctPH3XOs=
X-Proofpoint-GUID: ulKEosF6v29JW8DQVg6jM9ouzOD-QkpS
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9fb778 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=I_ukrOqQsWpVYGr8uL4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX/OHsCwmWnW1A
 PLFoyN7CPK4SpdeTHx8MATewUj0KgokgeCkAdGHV73qjGNrKDTeV/6PdYdKBfOCY27Bm9pTHpQg
 dSy9YlsLOv/OAFLKEUnsxB5lxgYSzt6qoaYsUKf44bzWqgwo/tx1GADOToaAH1h9vWlkdY2h9RA
 yOUa40omRmc1jOZpkZiVf7fsNilz1HnVnF6nYlrrTXYFjIRf5o1VfwWhoIvMo3xZvbVbEnFDDQw
 1T4vMy3ABWzicd8X9Qz9+QLo2ruz7DgtYGeiOpxu/RwhFg6zSxH59MfMs/3iCatQTLnKIvJVi5d
 IbTITzrLrSJWitJKdm3/Oqt+gy97/rgJXAAQBEQawWWBcZgB7sny1a0Z7i3AJjYKaJkuIYBqETO
 V6ShmJI73Rv4ZWtBoNafJQGsOm59yLZUjWJMCxwOHOe/DzKoOs8FLgFQUoK7CP4P3R++Ga+C+UW
 MwP72gpW6eE8khZ9Z2w==
X-Proofpoint-ORIG-GUID: ulKEosF6v29JW8DQVg6jM9ouzOD-QkpS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074

On 26-09-07 12:51:17, Loic Poulain wrote:
> Add the Offline Processing Engine (OPE) device tree node for the
> Agatti platform (QCM2290). The node describes the five register
> regions (top, bus_read, bus_write, pipeline, qos), clocks, interrupt,
> interconnects, IOMMU mappings, and OPP table.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
