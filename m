Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795917;
	b=WRSUWw5toH+fDn9YYcU/1F9u5BOrZ7fq2fnuuwyZ8JKkNU+FxTBE+imrh7tqoU6CjTAl
	 Wv2IR5Ua8i4FiYUJ1cRgXjowkkpYkwEZHadKUR8/SqT1Da8C7E+/9OqrEJ0WmO9r5QnbV
	 uZiUsSFNIyo3VpbFGx0LDeZojv4UwLAsJ8Hf9UKuwVsqkYmhzVUjd5iktfWzLWXiIZpXw
	 0p3ncIKMuAULCfVwWgERLjCst7I6o/6Tt2y2S2Fhb3+T+6wjn+H2oZMO8j7wjEcJYh9SQ
	 cp1DmcrsBWdjiv6a4jfGnYlStiLql7QN+/XrZp2iIwqZc9w+a5gJR/QZChZnEjBq1BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795917;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8LLAAfDIbUIbvMJ7ojV13q8DDkcIUEMGc9YXYUHXuaU=;
	b=P31GnMEfhKZ6Wtum9r4ASI21Ije2q9yvBzK0ABRUzhSQDgGUoGV72QGemaLc1rjY6ZiF
	 YulYSwRqWsFL/hCjGCeDmq4/N9iKwb54e+VuhbQAZJkwbU9fSOxLBqGYbkdgJMeBaGCtD
	 PfzTgNM+9Hlo6tPGA4UhcWrT9vusNGt4niLd7jToAB0fbqseO6YvACEZztYPqmYHIcR6u
	 BGXQTUKsv3AgsbJT3qryhTaSGBjh5YU7yU1qQst0fvGGePYKR50dWj22xlij4bVidG8Ai
	 ecNnWdO2A3S+qeVP3CQJ39lKL4DOoJP5HDFTfscjMZ5RWkVrRqIwpnmgwvTmPSxWXig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eI3R2UEM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cH1h096l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A56606A321
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A56606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eI3R2UEM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cH1h096l
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp5oo2337932
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8LLAAfDIbUIbvMJ7ojV13q
	8DDkcIUEMGc9YXYUHXuaU=; b=eI3R2UEMlNhzs6B/vVajYLhAUc8I49tJDFqe1i
	69N5cangVE7hDo9uRvazzL2HLTBn/jrxmiVTpugZ1aLHigwr1B8iPqVY+tmI+KyT
	x6x24w9o4HInlPfjqth6gc/uKJsOmo7+poisLOoPibCd51EghIIjWEbIKwoqfkWo
	84/QbP1XptoTuC+bBZYrMlgx9oObSqQlVwNAhKBPw70jK94s84s/xjzcgRDRgJ4r
	8l6lCvEnoLc8zqmJk3dWkiTAUuZ0MzMtCt8C9/zSPgaRQEbXXmrUvkcLuOusKg7z
	F0KLNAfCXBDz63qVWTC/hp00eJvQaS58ZCKvRPFAJEHfhDjQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756ka1hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:11:55 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67a781c1069so2622401d50.1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 08:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795915; x=1796400715; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8LLAAfDIbUIbvMJ7ojV13q8DDkcIUEMGc9YXYUHXuaU=;
        b=cH1h096leOST54XfCcw4c94P1qpzpyg6RGXX9x5FI9Pp1rpsLMVuVTpQZh2UGebDux
         r8WUKuHsnY8/1cAa0+RsQ/kSCKzaaeqQUbTq93Q/z5Iy4zWaXFWOXMSyOHVQoB5OGnAm
         +kY8PmIV4ZxupfjL0FdrPrx01Aa0ECcp1W7ycwWmiKJhjO/uOnUNWJ766dnuXX9nIC1t
         SfGwS22uwZsGIj24bC/za7XXdqxpLdHiNDCZzKhR1CTUigjcmvp7+M4dwxcoVQ4jHyIh
         Nb0B9oBCbb30dBU18OIkhaJecsmT3BuZ7ip459u7S3uMBcFggEJw2ynHQmjFYqP0aMzd
         ye6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795915; x=1796400715;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8LLAAfDIbUIbvMJ7ojV13q8DDkcIUEMGc9YXYUHXuaU=;
        b=cwovX/06dq9kh0QvqizOUkU0511L7q4FfHGLIh7g0h78e7qZUn5905+UNZ0gyVEAXc
         fDHjcwcekzXfc9DImQKCWKerScbE7T9ODEL/kftynB8BmzEOIWNKpDk4Gat2JI0UaAG2
         CuSu3rXmcPTFNsrLbtPhpwv+jlZ4/CH7i3VMp/SJ4gyCaCryGQjrC6/n5l/JRxKmifiO
         77JBpZvUvUdjeg2kJTLzLd70+9MRGpb+j5hlgO9pTIDQL8zzScp7oFrEUNIQzCYcPaW4
         XQPYLaOI1WLKfMV5A+lYIbyyfXQBfb2EmBColBgZX+3LxGiy07T5ceJeg3uGhbIjHis2
         KAlg==
X-Gm-Message-State: APuU4Z9pY/qVpS/5YwYiy4AqfxLsCZmmzEGhZUrmA56n/4S1E9eiKVun
	F4QhlcNK1itigbfexqJEykcCOCCBwkk91+nxe9jzDtRPETFjtZl6VnuEEcvftnO/Qbiw9VR127c
	Jo89Np3/g7tux+WFW/omNZNsLU6T3asZu+sS1ycMG47+cGONu/WExUk8B79r1hrLBCA==
X-Gm-Gg: AZFdTZd9ckaJqOoojjS2tgcvxuo4eu6DNa7PopbAQ7FDq761fOQiwVAbSITYNo/WHkX
	7KnB7W8ZL7pNrVUUqasakFA6fQCo23KypTM6l2ZbZqbytWs7UL0NM8h5YgcMtR9i3BuEaCHbJc8
	WYvL+mvAFyVpd7d6JIN3AIvg7VJduTHBMFaJUQ1C1ySIcvtEDT/aXyBW9jQpDNmPikozAverakz
	bJuK0rMmGgCciyheU2/LdZlA7cU5M8cGxQy6/Ufja5A9gx1CZ1HK1nhwSV+VHdRe/sqszVU40UB
	kHcr9DDPMg7iIG768Ca4AR3lEmvVJB7TOe3OBtHRzoI718Wi+79xGDAqW11OFqL/UfwtINTeKuD
	AgI3qBE+WTGyMmtLhtebac43F1URS+GdWvXXL3A7T/D8G3QP9g2rp/Xi7sQE4CGgv29VE7Be8y2
	lkiP598OeO2e2t/k+zcHk+fldIAZq6Cr5Wmfd3QnSE61HK8pUmqStTQBqoCLtRpCbRO8VHdlZs8
	MIJrdz2imSd2d7onwvcds90RtsS
X-Received: by 2002:a05:690e:1919:b0:67c:1b89:b117 with SMTP id 956f58d0204a3-67df444fa54mr12364915d50.77.1795795914775;
        Fri, 27 Nov 2026 08:11:54 -0800 (PST)
X-Received: by 2002:a05:690e:1919:b0:67c:1b89:b117 with SMTP id 956f58d0204a3-67df444fa54mr12364842d50.77.1795795913995;
        Fri, 27 Nov 2026 08:11:53 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:11:52 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 0/8] media: qcom: camss: Report the hardware SOF
 timestamp
Date: Fri, 27 Nov 2026 17:11:50 +0100
Message-Id: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMarCWsC/23M0Q6CIBTG8VdxXIeTo8DoqvdoXSBQsqUYx6jmf
 PfQq9q8Odv/bN9vJuiid0iOxUyiSx59GHLUh4KYTg83R73NTaACwRjU1OgekXYvOiF1FSipbSu
 UVSQvxuiu/r1p50vuzuMU4mfDE1u/+05itKKyFWCtFlZqdQqI5eOp7yb0fZkPWbkEvwT/JyAT0
 BjFuWtqK/kOsSzLF64naLHwAAAA
X-Change-ID: 20261123-camss-hw-ts-e0297adb69d9
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX3rFd8pTaqj0C
 +euNL/s1po7EmT2r1OWgZcaTR2sfjnV5EuzRQDlmtmLnv8IcB1fR+0YL0zmEoMqDPjKbwjcnrju
 dnI2DdlGx0gtfC/QtGz7bUKiMFfOE1vsdldb59kpTMZHIXhKlrnmE0esQH0dQBkZrCDbmEkZVnx
 jtnXF2+xt3X3bkQQWDxjnny2ikz8czSqaKPyW8f2+XiT/76B5bJRWh1k2bG3qoZHUcUP1fA/PXL
 AZh/qoQa0cbPZENX4pKXmMQkOd4cmKdbXYZ1VCCKUAECV8+0bNibFnKKekpxsfk/Qlobj+gFnul
 Pgwp4Lvf9YUpgseegiGlOQoNw19zLmxo4NT7Mr7T3WgQ7p4vJGKgXhLEaYbhkVVWP6dH90sIAyD
 IFFyW5NqBVoADJ99LvTuYyE5I5r4cVPNOuc2PMkuaIIAh6oWCuoie/S5Iz6YNIrIpT+zBqbOsYD
 MZFHvn3rK2rYfdIp4dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX+WfagQEf/sdU
 KhnjVJFFT50oXvB1EZRGK0+04CHTxTJYXwrlBN8AOqPNCFYJzvNCvaB75A9b4yRyJ7QFm/MtIS9
 VpSnwqXZLAcB6FrRJVfqdPk1INY296c=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b09abcb cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UySOH1T43K12eaTAI2UA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-GUID: D6dmLAjbOZ3isdgDi7cONdTsGsXCVeaw
X-Proofpoint-ORIG-GUID: D6dmLAjbOZ3isdgDi7cONdTsGsXCVeaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

The CAMSS CSID latches the ARM architected counter on every start of
frame. This series uses that time to stamp the captured buffers.

V4L2 defines vb2_buf.timestamp as the time the first data byte was
captured, but CAMSS stamps buffers from the write master done interrupt,
once the frame has finished being written out to memory, which is about
a frame period late. The hardware value is free of interrupt latency and
is directly comparable with CLOCK_MONOTONIC, so it can be correlated
with other timestamped data such as IMU samples.

Patch 1 adds a CSID operation for reading the counter latched at SOF,
converts it to CLOCK_MONOTONIC once in the CSID core and keeps it for
the frame being captured. Patches 2 to 6 implement that operation on
csid-340, csid-gen2 and csid-gen3. Patch 7 uses it to stamp the buffers
and patch 8 reports the new source to userspace.

Patches 3 and 4 are picked from the timestamp support Bryan shared
earlier, with patch 4 adapted to the operation added in patch 1 rather
than doing its own conversion.

Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor. Over ~1030
consecutive frames at 60 fps, the jitter of the timestamp the CSID
computes, measured as the residual against a least-squares fit of the
frame cadence, against the interrupt time it replaces:

                        hardware SOF    interrupt time
      median                   43 ns            356 ns
      p95                     113 ns           1135 ns
      p99                     139 ns           4901 ns
      max                     181 ns          10680 ns
      rms                      60 ns           1123 ns
      cycle-to-cycle           72 ns           2658 ns

That is 19x tighter in rms and 59x in the worst case, and what is left
is essentially the 52 ns period of the 19.2 MHz counter the value comes
from.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v3:
- Dropped the v4l2-event patch and with it the event timestamp. The
  series now only changes the buffer timestamp, and the SOF time is kept
  for the frame being captured rather than put in the frame sync event.
  Reporting it through V4L2_EVENT_FRAME_SYNC needs the core change and a
  decision on the raw-value field asked for in v2, so it comes
  separately.
- New patches 5 and 6: implement the SOF timestamp on csid-gen3. Titan
  690 moved the timestamp controls from RDI_CFG0 to RDI_CFG1, so patch 5
  picks the register per SoC before patch 6 reports the value.
- Patch 1: fall back to the interrupt time when the CSID has no usable
  clock snapshot, and keep the first SOF of a stream on that fallback -
  the register update arming the latch is only committed at the frame
  boundary that same SOF signals, so no counter value is captured there.
  As a result the stored timestamp is never 0 and needs no fallback of
  its own.
- Add measured jitter numbers to this cover letter.
- Link to v2: https://lore.kernel.org/r/20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com

Changes in v2:
- Patch 2: read the latched counter through a new csid_hw_ops operation
  and do the conversion once in the CSID core, instead of passing the
  time into csid_sof_event() and open coding the register read in every
  CSI decoder (Bryan).
- New patch 7: report the timestamp source as V4L2_BUF_FLAG_TSTAMP_SRC_SOE
  on the SoCs that can track SOF, rather than leaving the queue
  advertising V4L2_BUF_FLAG_TSTAMP_SRC_EOF.
- Link to v1: https://lore.kernel.org/r/20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com

---
Bryan O'Donoghue (2):
      media: camss: Define timestamp registers for csid-gen2
      media: camss: csid-gen2: Report the hardware SOF timestamp

Loic Poulain (6):
      media: qcom: camss: csid: Add an operation to read the SOF timestamp
      media: qcom: camss: csid-340: Report the hardware SOF timestamp
      media: qcom: camss: csid-gen3: Fix the RDI timestamp controls on Titan 690
      media: qcom: camss: csid-gen3: Report the hardware SOF timestamp
      media: qcom: camss: Timestamp buffers at start of frame
      media: qcom: camss: Tell userspace we're using start-of-frame timestamps

 drivers/media/platform/qcom/camss/camss-csid-340.c |  37 ++++++-
 .../media/platform/qcom/camss/camss-csid-gen2.c    |  31 ++++++
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  44 +++++++-
 drivers/media/platform/qcom/camss/camss-csid.c     | 112 ++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h     |  19 ++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |   7 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   8 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss-video.c    |   2 +
 drivers/media/platform/qcom/camss/camss.c          |   6 ++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 11 files changed, 253 insertions(+), 15 deletions(-)
---
base-commit: 9bac1a31a7d2c1b9022913e52adffaff63c0784e
change-id: 20261123-camss-hw-ts-e0297adb69d9

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

