const selectLocation = (city, jobs) => {
    return ({
        type: "SWITCH_LOCATION",
        city: city,
        jobs: jobs
    });

}

window.selectLocation = selectLocation;

export default selectLocation